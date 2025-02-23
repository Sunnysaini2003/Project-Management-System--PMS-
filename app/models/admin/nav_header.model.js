
const h_nav = require('@helpers/navigation.helper');

function obj()
{
   let obj =  [
        
        { "type":"link", "icon":"nav-icon bi bi-house", "text":"Home", "badge":"", "data":"/admin/" },
        // { "type":"item", "icon":"nav-icon bi bi-speedometer2", "text":"Dashboard", "badge":"", "data":"/admin","link":"" },

        { "type":"link", "icon":"nav-icon fas fa-th", "text":"Contact", "badge":"", "data":"/admin/?working" },
    
      ];


      return obj;
}

function temp()
{
    let  obj ={};

    obj.link =      `<li class="nav-item d-none d-sm-inline-block">
                        <a href="{-data-}" class="nav-link">{-text-}</a>
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