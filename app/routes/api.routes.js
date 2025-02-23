
//Middlewares
const apiErrorsMiddleware = require('@middlewares/apiErrors.middleware');

//Controllers
const baseController = require('@controllers/api/base.controller');


module.exports = function(app)
{

    //Routes Starts Here ---------------------------------------------
    app.use('/api/', baseController);
    

    //Routes Ends Here ---------------------------------------------
    
    app.use(apiErrorsMiddleware); //Log all API trown errors


}