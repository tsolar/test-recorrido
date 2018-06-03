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
      <div className="list-group-item">
        <div className="row">
          <div className="col-xs-12 col-sm-3 col-lg-2">
            <img alt={this.props.busOperator.official_name} src={this.props.busOperator.icons.thumb} />
          </div>
          <div className="col-xs-12 col-sm-3 col-lg-4">
            <h5>
              {this.props.busOperator.official_name}
            </h5>
            <small>
              <AverageRating rating={this.props.busOperator.average_rating} />
            </small>
          </div>
          <div className="col-xs-12 col-sm-3 col-lg-4">
            <p>
              {this.props.busOperator.description}
            </p>
          </div>
          <small>
            <a className="btn btn-link" href={`/bus_operators/${this.props.busOperator.id}`}>Ver</a>
            <a className="btn btn-link" href={`/bus_operators/${this.props.busOperator.id}/edit`}>Editar</a>
          </small>
        </div>
      </div>
    );
  }
}

BusOperatorsItem.propTypes = {
  busOperator: PropTypes.object
};
export default BusOperatorsItem
