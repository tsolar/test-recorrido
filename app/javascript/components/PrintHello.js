import React from "react"
import PropTypes from "prop-types"

class PrintHello extends React.Component {
  render () {
    return (
      //<Hello name={this.props.name} />
        <p>hola asd {this.props.name}</p>
    );
  }
}

export default PrintHello
