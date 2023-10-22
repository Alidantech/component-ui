/**
 * The main js file has links the page and the components.
 * 
 */
//Search component
import { SearchContent } from './componentUI/SearchUI/Search.js';
import { SuggestContent } from './componentUI/SearchUI/Suggest.js';


const searchBtn = document.getElementById('search-btn');
const searchInput = document.getElementById('search-input');
const searchSuggestions = document.getElementById('search-suggestions');

searchBtn.addEventListener('click', () => {
  let keyword = searchInput.value;

  if (!keyword) {
    alert("Please enter a keyword");
  } else {
    SearchContent(keyword);
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
      SearchContent(keyword);
      searchSuggestions.innerHTML = '';
    }
  }
});

searchInput.addEventListener('input', function() {
    const keyword = this.value.trim();
    SuggestContent(keyword);
});

