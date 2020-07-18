import React, { Component } from 'react'
import NavBar from './components/NavBar'
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

  handleSubmit(event) {
    console.log(`${this.state.phrase}`);
    event.preventDefault();
  }

  handleChange(event) {
    this.setState({
      phrase: event.target.value
    });
  }

  render() {
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
export default App
