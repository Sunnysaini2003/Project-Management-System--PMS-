const express = require('express');
const router = express.Router();

const h_mysql = require('@helpers/mysql.helper');


const {asyncMiddleware} = require('middleware-async'); 


//Declaration
const config = require('config');
const { error } = require('winston');

//Middleware
const mw_auth = require('../../middlewares/auth.middleware');
//Helpers

//Models
const mo_layouts = require('@models/admin/layouts.model');

//mw_auth('web','test:test1'),
router.get('/',mw_auth('web','test:test1'), (req, res) =>
{
  let ret_obj = {};
  ret_obj.layout =  mo_layouts.main(req); //Layout Data
  
  ret_obj.title = 'Dashboard';
  ret_obj.desc = 'Dashboard';
  ret_obj.keyword = 'Dashboard';
  
  ret_obj.header = 'Dashboard';
  ret_obj.breadcrumbs = [{"text":"Home","link":"/admin/","icon": "bi bi-house-door"},{"text":"Dashboard","link":"#","icon": "bi bi-speedometer2",}
    
  ];
  
  
  
  
  
  // ret_obj.sample = "Hello i am sample";
  //res.send(JSON.stringify(req.auth));
  // res.send('Dashboard ' + JSON.stringify(req.auth.status)  );
  res.render('admin/dashboard',{ layout: 'admin/layouts/main_layout',data:ret_obj });

})

// router.get('/project', mw_auth('web',''), async (req, res) => {
//   let ret_obj = {};
//   ret_obj.layout = mo_layouts.main(req); // Layout Data
  
//   ret_obj.title = 'Products List';
//   ret_obj.desc = '';
//   ret_obj.keyword = '';
  
//   ret_obj.header = 'Projects';
//   ret_obj.breadcrumbs = [
//       {"text":"Home","link":"/admin/","icon":"bi bi-house"},
//       {"text":"Upcoming","link":"#","icon":"bi bi-geo"}
//   ];
  
//   let base_query_p = 'SELECT * FROM products';
//   let where_query_p = '';
//   let order_query_p = '';
//   let limit_query_p = '';

//   let total_rows = await h_mysql.execute('SELECT count(*) as count FROM (' + base_query_p + ') tb ' + where_query_p);
//   // ret_obj.paging = paging(total_rows[0].count, 10, 5);
  
//   // let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products', []);
//   let p_mil = await h_mysql.execute('SELECT id, milestone, due_date, description FROM milestones', []);
  
//   res.render('admin/entities/product/project', { layout: 'admin/layouts/main_layout', data: ret_obj, p_mil });
// });

module.exports = router;