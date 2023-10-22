/**
 * The main js file has links the page and the components.
 * 
 */
//Search component
import {SearchContent} from './componentUI/SearchUI/Search.js'

let searchBtn = document.getElementById('search-btn');
let keyword = document.getElementById('search-input').value;

searchBtn.addEventListener('click', ()=>{
      if (!keyword) {
            alert("please Enter a keyword")
      }
      
      SearchContent(keyword);
});