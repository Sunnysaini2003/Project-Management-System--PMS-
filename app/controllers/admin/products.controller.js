const express = require('express');
const router = express.Router();

//Declaration
const config = require('config');
const { error, log } = require('winston');
const mw_auth = require('../../middlewares/auth.middleware');
  //config.has('db_mysql.name') // Return true/false
  //config.get('db_mysql.name') //Returns value


//Web Routes ----------------------------------------------------------------------------------------------------

//Helpers 
const h_mysql = require('@helpers/mysql.helper');
//Models
const mo_layouts = require('@models/admin/layouts.model');
const { date } = require('joi');


//  Browse / List Web Route




router.get('/', mw_auth('web',''), async (req, res) => {
  let ret_obj = {};
  ret_obj.layout = mo_layouts.main(req); // Layout Data
  
  ret_obj.title = 'Products List';
  ret_obj.desc = '';
  ret_obj.keyword = '';
  
  ret_obj.header = 'Milestones';
  ret_obj.breadcrumbs = [
      {"text":"Home","link":"/admin/","icon":"bi bi-house"},
      {"text":"Milestone","link":"#","icon":"bi bi-geo"}
  ];
  
  let base_query_p = 'SELECT * FROM products';
  let where_query_p = '';
  let order_query_p = '';
  let limit_query_p = '';

  let total_rows = await h_mysql.execute('SELECT count(*) as count FROM (' + base_query_p + ') tb ' + where_query_p);
  ret_obj.paging = paging(total_rows[0].count, 10, 5);
  
  // let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products', []);
  let p_mil = await h_mysql.execute('SELECT id, milestone, due_date, description FROM milestones', []);
  
  res.render('admin/entities/product/product_list', { layout: 'admin/layouts/main_layout', data: ret_obj, p_mil });
});
router.get('/add_milestone', mw_auth('web',''), async (req, res) => {
  let ret_obj = {};
  ret_obj.layout = mo_layouts.main(req); // Layout Data
  
  ret_obj.title = 'Add Milestone';
  ret_obj.desc = '';
  ret_obj.keyword = '';
  
  ret_obj.header = 'Milestones';
  ret_obj.breadcrumbs = [
      {"text":"Milestones","link":"/admin/milestones/","icon":"bi bi-geo"},
      {"text":"Add Milestone","link":"#","icon":"bi bi-plus-square"}
  ];
  
  // let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products', []);
  ret_obj.sample = '';
  
  res.render('admin/entities/product/add_milestone', { layout: 'admin/layouts/main_layout', data: ret_obj });
});

router.post('/add_milestone', mw_auth('web',''), async (req, res) => {
  const { milestone, due_date, description } = req.body;

  const insert_obj = {
      milestone,
      due_date,
      description
  };

  try {
      await h_mysql.insert('milestones', insert_obj);
      res.redirect('/admin/milestones/');
  } catch (error) {
      console.error('Error inserting milestone:', error);
      res.status(500).send('Error inserting milestone');
  }
});
router.get('/tasks', mw_auth('web',''), async (req, res) =>{
  let ret_obj = {};
  ret_obj.layout =  mo_layouts.main(req); //Layout Data
  
  ret_obj.title = 'Products List';
  ret_obj.desc = '';
  ret_obj.keyword = '';
  
  ret_obj.header = 'Tasks';
  ret_obj.breadcrumbs = [{"text":"Tasks","link":"#","icon":"fa-solid fa-list-check"},{"text":"add_task","link":"","icon":"bi bi-plus-lg"},];
  

  
  //----------------------------------------------------------------------------------------------
  
  let base_query_p = 'select * from products'
  let where_query_p = '';
  let order_query_p = '';
  let limit_query_p = '';
let p_tasks = await h_mysql.execute('SELECT id,milestone_id,task_name,status,created_at,updated_at FROM tasks;')
   
let p_mil = await h_mysql.execute('SELECT id, milestone, due_date, description FROM milestones',[]);

  let total_rows = await h_mysql.execute('select count(*) as count from ('+ base_query_p +') tb '+ where_query_p);
  ret_obj.paging = paging(total_rows[0].count, 10,5);
  

  // Get pagging obj
  // let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products',[]);
  ret_obj.sample ='';
  //res.send(JSON.stringify(req.auth));
  // res.send('Dashboard ' + JSON.stringify(req.auth.status)  );
 
  res.render('admin/entities/product/tasks',{ layout: 'admin/layouts/main_layout',data:ret_obj,tasks:p_tasks,p_mil});
  
})



router.get('/task_view', mw_auth('web',''), async (req, res) =>{
  let ret_obj = {};
  ret_obj.layout =  mo_layouts.main(req); //Layout Data
  
  ret_obj.title = 'Products List';
  ret_obj.desc = '';
  ret_obj.keyword = '';
  
  ret_obj.header = 'Tasks';
  ret_obj.breadcrumbs = [{"text":"Tasks","link":"#","icon":"fa-solid fa-list-check"},{"text":"add_task","link":"","icon":"bi bi-plus-lg"},];
  

  
  //----------------------------------------------------------------------------------------------
  
  let base_query_p = 'select * from products'
  let where_query_p = '';
  let order_query_p = '';
  let limit_query_p = '';
let p_tasks = await h_mysql.execute('SELECT id,milestone_id,task_name,status,created_at,updated_at FROM tasks;')
   
let p_mil = await h_mysql.execute('SELECT id, milestone, due_date, description FROM milestones',[]);

  let total_rows = await h_mysql.execute('select count(*) as count from ('+ base_query_p +') tb '+ where_query_p);
  ret_obj.paging = paging(total_rows[0].count, 10,5);
  

  // Get pagging obj
  // let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products',[]);
  ret_obj.sample ='';
  //res.send(JSON.stringify(req.auth));
  // res.send('Dashboard ' + JSON.stringify(req.auth.status)  );
 
  res.render('admin/entities/product/task_view',{ layout: 'admin/layouts/main_layout',data:ret_obj, products: p_data,tasks:p_tasks,p_mil});
  
})



router.get('/coming', mw_auth('web',''), async (req, res) =>{
  let ret_obj = {};
  ret_obj.layout =  mo_layouts.main(req); //Layout Data
  
  ret_obj.title = 'Products List';
  ret_obj.desc = '';
  ret_obj.keyword = '';
  
  ret_obj.header = 'Tasks';
  ret_obj.breadcrumbs = [{"text":"Tasks","link":"#","icon":"fa-solid fa-list-check"},{"text":"add_task","link":"","icon":"bi bi-plus-lg"},];
  

  
  //----------------------------------------------------------------------------------------------
  
  let base_query_p = 'select * from products'
  let where_query_p = '';
  let order_query_p = '';
  let limit_query_p = '';
let p_tasks = await h_mysql.execute('SELECT id,milestone_id,task_name,status,created_at,updated_at FROM tasks;')
   
let p_mil = await h_mysql.execute('SELECT id, milestone, due_date, description FROM milestones',[]);

  let total_rows = await h_mysql.execute('select count(*) as count from ('+ base_query_p +') tb '+ where_query_p);
  ret_obj.paging = paging(total_rows[0].count, 10,5);
  

  // Get pagging obj
  let p_data = await h_mysql.execute('SELECT product_id, product_name, price, category FROM products',[]);
  ret_obj.sample ='';
  //res.send(JSON.stringify(req.auth));
  // res.send('Dashboard ' + JSON.stringify(req.auth.status)  );
 
  res.render('admin/entities/product/coming',{ layout: 'admin/layouts/main_layout',data:ret_obj, products: p_data,tasks:p_tasks,p_mil});
  
})



function paging(total_rows, page_size = 10, current_page = 1, paging_btn_count = 5)
{
  retObj = {};
  retObj.total_rows = total_rows;
  retObj.page_size = page_size;
  retObj.total_pages = Math.ceil(total_rows / page_size);
  retObj.first_index = ((current_page -1) * page_size)  + 1;
  retObj.last_index =current_page * page_size;
  retObj.last_index = retObj.last_index > total_rows ? total_rows : retObj.last_index; 
  retObj.current_page = current_page; 
  retObj.buttons = [];

  let page_window = Math.ceil(paging_btn_count /2 );
  let btn_start = 1;
  if (current_page <= page_window )
  {
      btn_start = 1;
  }
  else if( current_page >  retObj.total_pages - page_window )
  {
    btn_start = ( retObj.total_pages - paging_btn_count  + 1) ;
  }
  else
  {
    btn_start = current_page - ( page_window - 1);
  }

  if( current_page == 1)
  {
    retObj.buttons.push({'title':'First', 'page':0});
    retObj.buttons.push({'title':'Prev', 'page':0 });
  }
  else
  {
    retObj.buttons.push({'title':'First', 'page':1});
    retObj.buttons.push({'title':'Prev', 'page': current_page - 1 });
  }
  
  for(i=0; i< paging_btn_count;i++)
  {
    if( current_page == btn_start+i)
    {
      retObj.buttons.push({'title':btn_start + i, 'page':btn_start + i, 'current': true});
    }
    else
    {
      retObj.buttons.push({'title':btn_start + i, 'page': btn_start + i});
    }

  }

  if( current_page == retObj.total_pages)
  {

    retObj.buttons.push({'title':'Next', 'page':0 });
    retObj.buttons.push({'title':'Last', 'page':0 });
  }
  else
  {
    retObj.buttons.push({'title':'Next', 'page': current_page + 1 });
    retObj.buttons.push({'title':'Last', 'page':retObj.total_pages });
    
  }

  return retObj;
}


// Read / View Web Route
router.get('/:id', mw_auth('web',''), (req, res) =>
{
  res.send('/admin/products/:id    Product View:' + req.params.id );
})

// Add / Insert Web Route
router.get('/add', mw_auth('web',''), (req, res) =>
{
  res.send('/admin/products/add/:id    Product Add' );
})

// Edit / Update Web Route
router.get('/edit/:id', mw_auth('web',''), (req, res) =>
{
  res.send('/admin/products/edit/:id   Product Edit:' + req.params.id );
})



//API Routes ----------------------------------------------------------------------------------------------------
 
//Delete
router.get('/api/delete/:id', mw_auth('web',''), (req, res) =>
  {
    res.send('/admin/products/delete/:id    Product Delete:' + req.params.id );
  })
  
// Add
router.post('/api/insert', mw_auth('web',''), (req, res) =>
  {
    res.send('/admin/products/add    Product add POST'  );
  })

  //Edit
  router.get('/api/update/:id', mw_auth('web',''), (req, res) =>
    {
      res.send('/admin/products/edit/:id   Product Edit:' + req.params.id );
    })


module.exports = router;