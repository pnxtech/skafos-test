import React, { Component } from 'react';
import { connect } from 'react-redux';
import NavBar from '../components/NavBar'
import APIClient from '../lib/APIClient';
import { getStringHistory } from '../actions/StringList';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';

import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      phrase: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentWillMount() {
    this.props.getStringHistory();
  }

  async handleSubmit(event) {
    let client = new APIClient();
    let result;
    try {
      result = await client.makeRequest({
        endpoint: 'process',
      });
      console.log(result);
    } catch (e) {
      //todo handle error
    }
  }

  handleChange(event) {
    this.setState({
      phrase: event.target.value
    });
  }

  render() {
    let { stringHistory } = this.props;
    console.log('stringHistory', stringHistory);
    return (
      <div>
        <NavBar />
        <Card className="Simplecard">
          <CardContent>
            <Typography gutterBottom variant="h5" component="h2">
              String processing demo
            </Typography>
            <form className="form" onSubmit={this.handleSubmit}>
              <TextField id="standard-basic" label="enter string to process" value={this.state.phrase} onChange={this.handleChange}/>
            </form>
          </CardContent>
          <CardActions>
            <Button id="submit" type="submit" color="primary" onClick={this.handleSubmit}>Submit</Button>
          </CardActions>
        </Card>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    stringHistory: state.stringList.history
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    getStringHistory: () => dispatch(getStringHistory())
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(App);

