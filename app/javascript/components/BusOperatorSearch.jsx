import React from "react"
import PropTypes from "prop-types"
import axios from 'axios';
import ReactPaginate from 'react-paginate';
import BusOperatorsList from "./BusOperatorsList"

class BusOperatorSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      busOperators: [],
      currentOrder: "name"
    };

    this.orderByName = this.orderByName.bind(this);
    this.orderByRating = this.orderByRating.bind(this);
    this.handlePageClick = this.handlePageClick.bind(this);
  }

  componentDidMount() {
    this.orderByName(1);
  }

  currentOrderLabel() {
    switch(this.state.currentOrder) {
      case "name":
        return "nombre";
      case "rating":
        return "calificación";
      default:
        return "nombre";
    }
  }

  currentResultsText() {
    // si aún no se setea currentPage, no se muestra
    if(!this.state.currentPage) { return null }

    const firstResult = ((this.state.currentPage - 1) * 20) + 1;
    const currentPageLastCount = this.state.currentPage * 20;
    const lastResult = (this.state.totalCount > currentPageLastCount) ? currentPageLastCount : this.state.totalCount ;
    return (
      <p>
        Mostrando resultados desde el {firstResult} al {lastResult} de {this.state.totalCount}
      </p>
    )
  }

  orderByName(page) {
    axios.get("/bus_operators/search.json?order_by_name&page=" + page)
         .then(res => {
           const busOperators = res.data.data;
           this.setState({
             busOperators,
             currentOrder: "name",
             currentPage: res.data.page,
             pageCount: Math.ceil(res.data.totalCount / 20),
             totalCount: res.data.totalCount
           });
         });
  }

  orderByRating(page) {
    axios.get("/bus_operators/search.json?order_by_rating&page=" + page)
         .then(res => {
           const busOperators = res.data.data;
           this.setState({
             busOperators,
             currentOrder: "rating",
             currentPage: res.data.page,
             pageCount: Math.ceil(res.data.totalCount / 20),
             totalCount: res.data.totalCount
           });
         });
  }

  handlePageClick(data) {
    // como considera la primera página como 0, hay que sumarle 1 para obtener la página correcta
    const page = data.selected + 1;
    switch(this.state.currentOrder) {
      case "name":
        this.orderByName(page);
        break;
      case "rating":
        this.orderByRating(page);
        break;
      default:
        this.orderByName(page);
    }
  }

  renderBusOperatorList() {
    if(this.state.totalCount === 0) {
      // si totalCount está en 0, no hay ninguno; si no es un número, aún no han cargado
      return (
        <React.Fragment>
          <p>No hay operador de buses alguno.</p>
        </React.Fragment>
      )
    }
    return (
      <div>
        <BusOperatorsList busOperators={this.state.busOperators} />
        {this.renderPagination()}
      </div>
    )
  }

  renderPagination() {
    if(!this.state.totalCount) {
      // no mostrar mientras carga, ya que totalCount no está seteado aún
      return null
    }

    // ReactPaginate considera la primera página como 0
    const currentPage = this.state.currentPage - 1;

    return <ReactPaginate previousLabel={"<"}
                          nextLabel={">"}
                          breakLabel={<a className="page-link" href="">...</a>}
                          breakClassName={"break-me page-item"}
                          pageCount={this.state.pageCount}
                          marginPagesDisplayed={2}
                          pageRangeDisplayed={5}
                          onPageChange={this.handlePageClick}
                          forcePage={currentPage}
                          containerClassName={"pagination"}
                          subContainerClassName={"pages pagination"}
                          activeClassName={"active"}
                          pageClassName={"page-item"}
                          pageLinkClassName={"page-link"}
                          previousClassName={"page-item"}
                          previousLinkClassName={"page-link"}
                          nextClassName={"page-item"}
                          nextLinkClassName={"page-link"} />
  }

  render () {
    return (
      <div>
        <div className="filters">
          <div className="btn-group" role="group">
            <button type="button" className="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Ordenar por
            </button>
            <div className="dropdown-menu" aria-labelledby="btnGroupDrop1">
              <a className="dropdown-item" onClick={() => this.orderByName(1)}>Nombre</a>
              <a className="dropdown-item" onClick={() => this.orderByRating(1)}>Calificación</a>
            </div>
          </div>
          <p>
            Ordenando por {this.currentOrderLabel()}.
            {this.currentResultsText()}
          </p>
        </div>
        {this.renderBusOperatorList()}
      </div>
    );
  }
}

export default BusOperatorSearch