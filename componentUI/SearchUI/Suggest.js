// The search component client

async function SuggestContent(queryKeyword) {
  try {
    const response = await fetch('SearchComponent/index.php', {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ keyword: queryKeyword }),
    });

    if (!response.ok) {
      throw new Error('HTTP request failed');
    }

    const suggestions = await response.json();

    // return the JSON response from the serve
    displaySuggestions(suggestions)
  } catch (error) {
    console.error('Error:', error);
  }
}

function displaySuggestions(data) {
    const searchSuggestions = document.getElementById('search-suggestions');

    searchSuggestions.innerHTML = ''; // Clear previous suggestions

    if (data && Array.isArray(data) && data.length > 0) {
        const list = document.createElement('ul');
        data.forEach((result, index) => {
            const rowDiv = document.createElement('li');

            // Iterate through the keys (columns) and display only the first two columns
            let columnIndex = 0;
            for (const key in result) {
                if (result.hasOwnProperty(key)) {
                    if (columnIndex < 3) { // Limit to the first two columns
                        const cellDiv = document.createElement('span');
                        cellDiv.textContent = result[key];
                        rowDiv.appendChild(cellDiv);
                        columnIndex++;
                    }
                }
            }
            list.appendChild(rowDiv);
        });

        searchSuggestions.appendChild(list);
    } else {
        searchSuggestions.innerHTML = 'No results found for the keyword.';
    }
}



export { SuggestContent };
