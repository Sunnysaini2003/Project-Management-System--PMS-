
const h_nav = require('@helpers/navigation.helper');

function obj()
{
   let obj =  [
        { "type":"item", "icon":"nav-icon bi bi-speedometer2", "text":"Dashboard", "badge":"", "data":"/admin","link":"" },
        // { "type":"item", "icon":"nav-icon fa-regular fa-file", "text":"Projects", "badge":"", "data":"/admin/project","link":"" },
        
        { "type":"item", "icon":"nav-icon bi bi-geo", "text":"Milestone", "badge":"", "data":"/admin/milestones" },
        { "type":"item", "icon":"nav-icon fa-solid fa-list-check", "text":"Tasks", "badge":"<label clss='danger'></label>", "data":"/admin/milestones/tasks" },
        { "type":"item", "icon":"nav-icon fa-regular fa-calendar", "text":"Calender", "badge":"", "data":"/admin/milestones/coming" },
        { "type":"item", "icon":"nav-icon bi bi-cup-hot", "text":"Teams", "badge":"<label clss='danger'></label>", "data":"/admin/milestones/coming" },
        
        // { "type":"dropdown", "icon":"nav-icon fas fa-th", "text":"Sub-Tasks", "badge":"<label clss='danger'></label>", "data": [
        //         { "type":"section", "icon":"nav-icon fas fa-thnav-icon fas fa-th", "text":"Tasks", "badge":"", "data":"" },
        //         { "type":"item", "icon":"nav-icon fas fa-th", "text":"Tasks", "badge":"<label clss='danger'></label>", "data":"/admin/dsgfzs" }
        // ]}
    
      ];


      return obj;
}

function temp()
{
    let  obj ={};

    obj.section =   '<li class="nav-header">{-text-}</li>';
    obj.item =      `<li class="nav-item"> 
                        <a href="{-data-}" class="nav-link"> 
                            <i class="{-icon-}"></i> 
                            <p> {-text-}{-badge-} </p>
                         </a> 
                    </li>`;

    obj.dropdown =  `<li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="{-icon-}"></i>
                            <p>{-text-} <i class="fas fa-angle-left right"></i> {-badge-}</p>
                        </a>
                        <ul class="nav nav-treeview"> {-data-} </ul>
                    </li>`;

    return obj;
}

function html()
{
    return h_nav.fill_html(obj(),temp());
}



exports.html = html;
exports.obj  = obj;
exports.temp  = temp;