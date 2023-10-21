# To-Do List for Components UI

Here is a simple explaination of what is expected for the User Interface of the components.

## Main Page

1. Create a header on the top page with a link to various components.
2. Create a footer at the bottom of the page with links to various parts of the page.


## Search UI

1. Create a search bar and a div with id, `search-input`, and `search-view` respectively as shown below:

    ```html
        <div id="search-bar">
            <input type="text" id="search-input" placeholder="Search...">
            <button id="search-button">Search</button>
        </div>
        <div id="search-view">
            <!-- Search results will be displayed here -->
        </div>
    ```

2. Create a CSS file to style the search UI.

    ```css
    /* Add styling to the search bar */
    #search-bar {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    ```
