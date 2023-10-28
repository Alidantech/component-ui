// The search component client

async function SearchContent(queryKeyword) {
  try {
    // Load the table JSON from a file
    const tableJSON = await fetch('componentUI/SearchUI/tables.json').then((response) => response.json());

    const requestBody = {
      keyword: queryKeyword,
      tables: tableJSON
    };
    const response = await fetch('SearchComponent/index.php', {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      throw new Error('HTTP request failed');
    }

  
    const data = await response.text();
    console.log(data)
    // return the JSON response from the server
    displaySearchResults(data);
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

    // Create the header row based on the keys of the first object in the data
    const headerRow = document.createElement('div');
    headerRow.className = 'result-row header-row';

    for (const key in data[0]) {
      if (data[0].hasOwnProperty(key)) {
        const headerCell = document.createElement('div');
        headerCell.className = 'result-cell header-cell'; // Add a class for styling
        headerCell.textContent = key;
        headerRow.appendChild(headerCell);
      }
    }

    tableDiv.appendChild(headerRow);

    data.forEach((result, index) => {
      const rowDiv = document.createElement('div');
      rowDiv.className = 'result-row'; // Add a class for styling

      for (const key in result) {
        if (result.hasOwnProperty(key)) {
          const cellDiv = document.createElement('div');
          cellDiv.className = 'result-cell'; // Add a class for styling
          cellDiv.textContent = result[key];
          rowDiv.appendChild(cellDiv);
        }
      }

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
