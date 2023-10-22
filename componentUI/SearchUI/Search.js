// The search component client

async function SearchContent(queryKeyword) {
  try {
    const response = await fetch('index.php', {
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

    // Handle the JSON response from the server
    console.log(data);

  } catch (error) {
    console.error('Error:', error);
  }
}

export { SearchContent };
