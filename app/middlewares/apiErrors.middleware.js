module.exports = function(err,req,res,next)
{

    //Log Error Here
    res.status(500).send('Somthing Failed');
}