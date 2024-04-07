import React from 'react';

const EarthquakeTable = ({ data, onPageChange, totalPages, currentPage }) => {

  const pageNumbers = [];
  for (let i = 1; i <= totalPages; i++) {
    if (i === 1 || i === totalPages || (i >= currentPage - 2 && i <= currentPage + 2)) {
      pageNumbers.push(i);
    }
  }

  return (
    <>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Magnitud</th>
            <th>Ubicación</th>
            <th>Tiempo</th>
            <th>Tipo Mag</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id}>
              <td>{item.id}</td>
              <td>{item.attributes.magnitude}</td>
              <td>{item.attributes.place}</td>
              <td>{item.attributes.time}</td>
              <td>{item.attributes.mag_type}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="pagination">
        {currentPage > 1 && (
          <button onClick={() => onPageChange(currentPage - 1)}>Anterior</button>
        )}
        {pageNumbers.map(number => (
          <button
            key={number}
            className={currentPage === number ? 'active' : ''}
            onClick={() => onPageChange(number)}
          >
            {number}
          </button>
        ))}
        {currentPage < totalPages && (
          <button onClick={() => onPageChange(currentPage + 1)}>Siguiente</button>
        )}
      </div>
    </>
  );
};

export default EarthquakeTable;