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
var tablesJsonPath = 'jsonFiles/tables.json';

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
var Load = document.getElementById('loading-container');

searchGrades.addEventListener('click', function(event) {
  event.preventDefault();
  tablesJsonPath = 'jsonFiles/grades.json';
  Load.classList.toggle('showLoad');
  Load.innerHTML = this.title;
  searchTitle.innerHTML = this.title;
  searchInput.placeholder = this.title
})


searchStudents.addEventListener('click', function(event) {
  event.preventDefault();

  tablesJsonPath = 'jsonFiles/students.json';
  Load.classList.toggle('showLoad');
  Load.innerHTML = this.title;
  searchTitle.innerHTML = this.title;
  searchInput.placeholder = this.title

  
})
Load.classList.remove('showLoad');

searchClasses.addEventListener('click', function(event) {
  event.preventDefault();

  tablesJsonPath = 'jsonFiles/classes.json';
  Load.classList.toggle('showLoad');
  Load.innerHTML = this.title;
  searchTitle.innerHTML = this.title;
  searchInput.placeholder = this.title

  
})

searchCourses.addEventListener('click', function(event) {
  event.preventDefault();

  tablesJsonPath = 'jsonFiles/courses.json';
  Load.classList.toggle('showLoad');
 Load.innerHTML = this.title;
  searchTitle.innerHTML = this.title;
  searchInput.placeholder = this.title
  
})

searchTeachers.addEventListener('click', function(event) {
  event.preventDefault();

  tablesJsonPath = 'jsonFiles/teachers.json';
  Load.classList.toggle('showLoad');
  Load.innerHTML = this.title;
  searchTitle.innerHTML = this.title;
  searchInput.placeholder = this.title
})