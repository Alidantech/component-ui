// The search component client

async function SearchContent(queryKeyword) {
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

    const data = await response.json();

    // return the JSON response from the serve
    displaySearchResults(data)
  } catch (error) {
    console.error('Error:', error);
  }
}

function displaySearchResults(data) {
  const searchViewDiv = document.getElementById('search-view');

  // Clear the existing content in the "search-view" div
  searchViewDiv.innerHTML = '';

  if (data && Array.isArray(data) && data.length > 0) {
    const tableDiv = document.createElement('div');
    tableDiv.className = 'result-table'; // Add a class for styling

    data.forEach((result, index) => {
      const rowDiv = document.createElement('div');
      rowDiv.className = 'result-row'; // Add a class for styling

      const resultDiv = document.createElement('div');
      resultDiv.className = 'result-cell'; // Add a class for styling
      resultDiv.textContent = `${result.first_name} ${result.last_name}`;
      rowDiv.appendChild(resultDiv);

      const birthdateDiv = document.createElement('div');
      birthdateDiv.className = 'result-cell'; // Add a class for styling
      birthdateDiv.textContent = `Birthdate: ${result.birthdate}`;
      rowDiv.appendChild(birthdateDiv);

      tableDiv.appendChild(rowDiv);
    });

    searchViewDiv.appendChild(tableDiv);
  } else {
    const noResultDiv = document.createElement('div');
    noResultDiv.textContent = 'No results found for the keyword.';
    searchViewDiv.appendChild(noResultDiv);
  }
}

export { SearchContent };
