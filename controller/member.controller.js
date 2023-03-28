const { request, response } = require("express")
const memberModel = require(`../models/index`).member
const Op = require(`sequelize`).Op
const path = require(`path`)
const fs = require(`fs`)
const upload = require(`../middlewares/member-validation`).single(`photo`)

exports.getAllMember = async (request, response) => {
    let member = await memberModel.findAll()
    return response.json({
        success: true,
        data: member,
        message: `All member have been loaded` 
    })
}

exports.getMember = async (request, response) => {
    const {id}  = request.params;
    let member = await memberModel.findOne(
        {
            where: {
                id
            }
        }
    )
    
    return response.json({
        success: true,
        data: member,
        message: `member loaded`
    })
}

exports.findMember = async (request, response) => {
    let keyword = request.body.keyword
    let member = await memberModel.findAll({
        where: {
            [Op.or]: [
                {name: {[Op.substring]: keyword}},
                {gender: {[Op.substring]: keyword}},
                {address: {[Op.substring]: keyword}},
                {contact: {[Op.substring]: keyword}},
            ]
        }
    })
    return response.json({
        success: true,
        data: member,
        message: `All member have been loaded`
    })
}

exports.addMember = (request, response) => {
    upload(request, response, async error => {
        if (error){
            return response.json({message: error})
        }
        // if(!request.file){
        //     return response.json({message: `nothing to upload`})
        // }
        let newMember = {
            name: request.body.name,
            address: request.body.address,
            gender: request.body.gender,
            contact: request.body.contact,
            // photo: request.file.filename
        }
        memberModel.create(newMember)
        .then(result => {
            return response.json({
                success: true,
                data: result,
                message: `New Member has been inserted`
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

exports.updateMember = async (request, response) => {
    upload(request, response, async error => {
        if (error){
            return response.json({message: error})
        }
        let id = request.params.id

        let Member = {
            name: request.body.name,
            address: request.body.address,
            gender: request.body.gender,
            contact: request.body.contact,
            photo: request.body.photo
        }

        if (request.file){
            const selectedMember = await memberModel.findOne({
                where: {id:id}
            })
            const oldPhotoMember = selectedMember.photo
            const pathPhoto = path.join(__dirname, `../photo`, oldPhotoMember)
            if(fs.existsSync(pathPhoto)) {
                fs.unlink(pathPhoto, error => console.log(error))
            }
            Member.photo = request.file.filename
        }
        memberModel.update(Member, {where: {id: id}})
        .then(result => {
            return response.json({
                success: true,
                message: `Data member has been updated`
            })
        })
        .catch(error => {
            return response.json({
            })
        })
    })
}

exports.photoMember = async (request, response) => {
    upload(request, response, async error => {
        if (error){
            return response.json({message: error})
        }
        let id = request.params.id

        let Member = {
            photo: request.file.filename
        }

        memberModel.update(Member, {where: {id: id}})
        .then(result => {
            return response.json({
                success: true,
                message: `Data member has been updated`
            })
        })
        .catch(error => {
            return response.json({
            })
        })
    })
}


exports.deleteMember = async (request, response) => {
    let idMember = request.params.id
    const member = await memberModel.findOne({ where: { id: idMember } })
    const oldPhotomember = member.photo
    const pathPhoto = path.join(__dirname, `../photo`,oldPhotomember)
        if (fs.existsSync(pathPhoto)) {
            fs.unlink(pathPhoto, error => console.log(error))
        }
        memberModel.destroy({where: {id: idMember}})
        .then(result => {
            return response.json({
                success: true,
                message: `Data member has been deleted`
            })
        })
        .catch(error => {
            return response.json ({
                success: false,
                message: error.message
            })
        })
    }