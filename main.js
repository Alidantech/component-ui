/**
 * The main js file has links the page and the components.
 * 
 */
//Search component
import { SearchContent } from './SearchUI/Search.js';
import { SuggestContent } from './SearchUI/Suggest.js';

const searchBtn = document.getElementById('search-btn');
const searchInput = document.getElementById('search-input');
const searchSuggestions = document.getElementById('search-suggestions');
var tablesJsonPath = 'jsonFiles/students.json';

searchBtn.addEventListener('click', () => {
  let keyword = searchInput.value;
  if (!keyword) {
    alert("Please enter a keyword");
  } else {
    SearchContent(keyword, tablesJsonPath);
    searchSuggestions.innerHTML = '';
  }
});

// Add an event listener for the Enter key press on the input field
searchInput.addEventListener('keyup', (event) => {
  if (event.key === "Enter") {
    // Prevent the default form submission
    event.preventDefault();

    // Trigger the search when the Enter key is pressed
    let keyword = searchInput.value;

    if (!keyword) {
      alert("Please enter a keyword");
    } else {
  
      SearchContent(keyword, tablesJsonPath);
      searchSuggestions.innerHTML = '';
    }
  }
});

searchInput.addEventListener('input', function() {
    const keyword = this.value.trim();
    SuggestContent(keyword, tablesJsonPath);
});

// Create links to all the seach funtions on the website
const searchGrades = document.getElementById('search-grades');
const searchStudents = document.getElementById('search-students');
const searchCourses = document.getElementById('search-courses');
const searchTeachers = document.getElementById('search-teachers');
const searchClasses = document.getElementById('search-classes');
const searchTitle = document.getElementById('search-title');
// var Load = document.getElementById('loading-container');
var LoadTitle = document.getElementById('load-title');
const Load = document.getElementById('loading-container');

function showLoadingSpinner(title, jsonPath) {
  Load.classList.add('showLoad');
  LoadTitle.innerHTML = title;
  searchTitle.innerHTML = title;
  searchInput.placeholder = title;
  setTimeout(function() {
    Load.classList.remove('showLoad');
  }, 2000);
  tablesJsonPath = jsonPath;
}



// Add event listeners for the remaining search links
searchGrades.addEventListener('click', function(event) {
  event.preventDefault();
  const jsonPath = 'jsonFiles/grades.json';
  showLoadingSpinner(this.title, jsonPath);
});

searchStudents.addEventListener('click', function(event) {
  event.preventDefault();
  const jsonPath = 'jsonFiles/students.json';
  showLoadingSpinner(this.title, jsonPath);
});

searchCourses.addEventListener('click', function(event) {
  event.preventDefault();
  const jsonPath = 'jsonFiles/courses.json';
  showLoadingSpinner(this.title, jsonPath);
});

searchTeachers.addEventListener('click', function(event) {
  event.preventDefault();
  const jsonPath = 'jsonFiles/teachers.json';
  showLoadingSpinner(this.title, jsonPath);
});

searchClasses.addEventListener('click', function(event) {
  event.preventDefault();
  const jsonPath = 'jsonFiles/classes.json';
  showLoadingSpinner(this.title, jsonPath);
});

