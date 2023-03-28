const Joi = require(`joi`)
const validateBorrow =  (request, response, next) => {
    const rules = Joi
    .object()
    .keys({
        memberID: Joi.number().required(),
        adminID: Joi.number().required(),
        date_of_borrow: Joi.date().required(),
        date_of_return: Joi.allow(null),
        status: Joi.string().valid("false","true"),
        details_of_borrow: Joi.required()
    })
    .options({abortEarly: false})

    let {error} = rules.validate(request.body)

    if (error != null){
        let errMessage = error.details.map(it => it.message).join(",")
        return response.status(422).json({
            success: false,
            message: errMessage
        })
    }
    next()
}
module.exports = {validateBorrow}