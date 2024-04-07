import React, { useEffect, useState } from 'react';
import './App.css';
import EarthquakeTable from './EarthquakeTable';

function App() {
  const [earthquakes, setEarthquakes] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);
  const [filter, setFilter] = useState('');

  useEffect(() => {
    let url = `http://localhost:3000/api/features?page=${currentPage}&per_page=10`;
    if (filter) {
      url += `&filters[mag_type]=${filter}`;
    }

    fetch(url)
      .then(response => response.json())
      .then(data => {
        setEarthquakes(data.data);
        setTotalPages(data.pagination.total / data.pagination.per_page);
      })
      .catch(error => console.error('Error fetching data:', error));
  }, [currentPage, filter]);

  const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
  };

  const handleFilterChange = (e) => {
    setFilter(e.target.value);
    setCurrentPage(1); // Restablecer a la página 1 al cambiar el filtro
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Eventos Sísmicos</h1>
        <h2>Información actualizada de actividad sísmica</h2>
        
        <div className="App-header-autor">
          <p>Desarrollado por:</p>
          <p>Kevin Useche Jimenez</p>  
          <p>iTzKevin</p>  
          <img src={`${process.env.PUBLIC_URL}/images/kevin.svg`} alt="Logo" />
        </div>
      </header>
      <div className='App-data-section'>
        <select className='App-data-filter' value={filter} onChange={handleFilterChange}>
          <option value="">Todos los Tipos</option>
          <option value="md">md</option>
          <option value="ml">ml</option>
          <option value="ms">ms</option>
          <option value="mw">mw</option>
          <option value="me">me</option>
          <option value="mi">mi</option>
          <option value="mb">mb</option>
          <option value="mlg">mlg</option>
        </select>
        <EarthquakeTable
          data={earthquakes}
          onPageChange={handlePageChange}
          totalPages={totalPages}
          currentPage={currentPage}
        />
      </div>

    </div>
  );
}

export default App;