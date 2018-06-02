import React from "react"
import PropTypes from "prop-types"
import BusOperatorsItem from "./BusOperatorsItem"

class BusOperatorsList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      busOperators: props.busOperators
    };
  }

  componentWillReceiveProps(nextProps) {
    this.setState({busOperators: nextProps.busOperators})
  }

  render () {
    const busOperatorsList = this.state.busOperators.map(
      busOperator => <BusOperatorsItem
                       key={`busOperator-${busOperator.internal_name}-${busOperator.id}`}
                       busOperator={busOperator} />
    )

    return (
      <React.Fragment>
        <ul className="bus-operators-list">
          { busOperatorsList }
        </ul>
      </React.Fragment>
    );
  }
}

BusOperatorsList.propTypes = {
  busOperators: PropTypes.array
};
export default BusOperatorsList
