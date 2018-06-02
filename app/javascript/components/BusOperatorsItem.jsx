import React from "react"
import PropTypes from "prop-types"

const AverageRating = props => {
  if(props.rating || props.rating == 0) {
    return <span>{props.rating} de 5</span>
  } else {
    return null;
  }
}

class BusOperatorsItem extends React.Component {
  render () {
    return (
      <li className="row">
        <div className="col-xs-12 col-sm-3 col-lg-2 ">
          <img alt={this.props.busOperator.official_name} src={this.props.busOperator.icons.thumb} />
        </div>
        <div className="col-xs-12 col-sm-3 col-lg-4 ">
          <p className="official_name">
            <a href={`/bus_operators/${this.props.busOperator.id}`}>
              {this.props.busOperator.official_name}
            </a>
          </p>
        </div>
        <div className="col-xs-12 col-sm-3">
          <p className="average-rating">
            <AverageRating rating={this.props.busOperator.average_rating} />
          </p>
        </div>
        <div className="col-xs-12 col-sm-3">
          <div className="row">
            <div className="col">
              <a href={`/bus_operators/${this.props.busOperator.id}`}>Ver</a>
            </div>
            <div className="col">
              <a href={`/bus_operators/${this.props.busOperator.id}/edit`}>Editar</a>
            </div>
          </div>
        </div>
      </li>
    );
  }
}

BusOperatorsItem.propTypes = {
  busOperator: PropTypes.object
};
export default BusOperatorsItem
