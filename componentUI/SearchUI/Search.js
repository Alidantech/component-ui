function SearchContent() {
    const searchTerm = document.getElementById("search-input").value;
    const results = '';

    fetch("SearchComponent/index.php", {
        method: "POST",
        body: new URLSearchParams({ searchTerm }),
    })
    .then((response) => response.json())
    .then((data) => {
        if (data.success) {
            // Display the search results
            results = data.results;
            console.log(results)
            // Process and display results as needed
        } else {
            // Handle the case when the search term is not provided or other errors
            console.error(data.error);
        }
    })
    .catch((error) => {
        console.error("An error occurred:", error);
    });
}




export {SearchContent};