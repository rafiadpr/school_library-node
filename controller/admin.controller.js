const { request, response } = require("express")
const adminModel = require(`../models/index`).admin
const Op = require(`sequelize`).Op
const md5 = require(`md5`)
let password = md5(`password`)

exports.getAllAdmin = async (request, response) => {
    let admin = await adminModel.findAll()
    return response.json({
        success: true,
        data: admin,
        message: `All admin have been loaded` 
    })
}

exports.findAdmin = async (request, response) => {
    let keyword = request.body.keyword
    let admin = await adminModel.findAll({
        where: {
            [Op.or]: [
                {name: {[Op.substring]: keyword}},
                {contact: {[Op.substring]: keyword}},
                {address: {[Op.substring]: keyword}},
            ]
        }
    })
    return response.json({
        success: true,
        data: admin,
        message: `All admin have been loaded`
    })
}

exports.addAdmin = (request, response) => {
    let newadmin = {
        name: request.body.name,
        contact: request.body.contact,
        address: request.body.address,
        username: request.body.username,
        password: md5(request.body.password) 
    }
    adminModel.create(newadmin)
    .then(result => {
        return response.json({
            success: true,
            data: result,
            message: `New admin has been inserted`
        })
    })
    .catch(error => {
        return response.json({
            success: false,
            message: error.message
        })
    })
}

exports.updateAdmin = (request, response) => {
    let dataadmin = {
        name: request.body.name,
        contact: request.body.contact,
        address: request.body.address,
        username: request.body.username,
        password: md5(request.body.password)
    }
    let idadmin = request.params.id
    adminModel.update(dataadmin, {where: {id:idadmin}})
    .then(result => {
        return response.json({
            success: true,
            message: `Data admin has been updated`
        })
    })
    .catch(error => {
        return response.json({
            success: false,
            message: error.message
        })
    })
}

exports.deleteAdmin = (request, response) => {
    let idadmin = request.params.id
    adminModel.destroy({where: {id: idadmin}})
    .then(result => {
        return response.json({
            success: true,
            message: `Data admin has been deleted`
        })
    })
    .catch(error => {
        return response.json ({
            success: false,
            message: error.message
        })
    })
}