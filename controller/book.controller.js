const bookModel = require(`../models/index`).book
const Op = require(`sequelize`).Op
const path = require(`path`)
const fs = require(`fs`)
const upload = require(`../middlewares/books-validation`).single(`cover`)

exports.getAllBooks = async (request, response) => {
    let books = await bookModel.findAll()
    return response.json({
        success: true,
        data: books,
        message: `All books have been loaded` 
    })
}

exports.getBook = async (request, response) => {
    const {id}  = request.params;
    let book = await bookModel.findOne(
        {
            where: {
                id
            }
        }
    )
    
    return response.json({
        success: true,
        data: book,
        message: `book loaded`
    })
}

exports.findBooks = async (request, response) => {
    let keyword = request.body.keyword
    let books = await bookModel.findAll({
        where: {
            [Op.or]: [
                {isbn: {[Op.substring]: keyword}},
                {title: {[Op.substring]: keyword}},
                {author: {[Op.substring]: keyword}},
                {category: {[Op.substring]: keyword}},
                {publisher: {[Op.substring]: keyword}}
            ]
        }
    })
    return response.json({
        success: true,
        data: books,
        message: `All books have been loaded`
    })
}

exports.addBooks = (request, response) => {
    upload(request, response, async error => {
        if (error){
            return response.json({message: error})
        }
        if(!request.file){
            return response.json({message: `nothing to upload`})
        }
        let newBook = {
            isbn: request.body.isbn,
            title: request.body.title,
            author: request.body.author,
            publisher: request.body.publisher,
            category: request.body.category,
            stock: request.body.stock,
            cover: request.file.filename
        }
        bookModel.create(newBook)
        .then(result => {
            return response.json({
                success: true,
                data: result,
                message: `New books has been inserted`
            })
        })
        .catch(error => {
            return response.json({
                success: false,
                message: error.message
            })
        })
    })
}

exports.updateBook = async (request, response) => {
    upload(request, response, async error => {
        if (error){
            return response.json({success: false, message: error})
        }
        let id = request.params.id

        let book = {
            isbn: request.body.isbn,
            title: request.body.title,
            author: request.body.author,
            publisher: request.body.publisher,
            category: request.body.category,
            stock: request.body.stock,
            // cover: request.body.cover,
        }

        if (request.file){
            const selectedBook = await bookModel.findOne({
                where: {id:id}
            })
            const oldCoverBook = selectedBook.cover
            const pathCover = path.join(__dirname, `../cover`, oldCoverBook)
            if(fs.existsSync(pathCover)) {
                fs.unlink(pathCover, error => console.log(error))
            }
            book.cover = request.file.filename
        }
        bookModel.update(book, {where: { id: id }})
            .then(result => {
                return response.json({
                    success: true,
                    message: `Data books has been updated`
            })
        })
        .catch(error => {
            return response.json({
                success: false,
                message: `Data book has not been updated`
            })
        })
    })
}

exports.deleteBook = async (request, response) => {
    const id = request.params.id
    const book = await bookModel.findOne({ where: { id: id } })
    const oldCoverBook = book.cover
    const pathCover = path.join(__dirname, `../cover`,oldCoverBook)
        if (fs.existsSync(pathCover)) {
            fs.unlink(pathCover, error => console.log(error))
        }
        bookModel.destroy({ where: { id: id } })
            .then(result => {
                return response.json({
                success: true,
                message: `Data book has been deleted`
            })
        })
            .catch(error => {
                return response.json({
                success: false,
                message: error.message
            })
        })
    }