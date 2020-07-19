import React, { Component } from 'react';
import { connect } from 'react-redux';
import NavBar from '../components/NavBar'
import { getStringHistory, submitString } from '../actions/StringList';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import Divider from '@material-ui/core/Divider';
import Badge from '@material-ui/core/Badge';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      phrase: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.props.getStringHistory();
  }

  async handleSubmit(event) {
    this.props.submitString(this.state.phrase);
    this.setState({
      phrase: ''
    });
  }

  handleChange(event) {
    this.setState({
      phrase: event.target.value
    });
  }

  render() {
    let cindex = 0;
    let { stringHistory } = this.props;
    let listItems = stringHistory.reverse().map(item => (
      <div key={cindex++}>
        <ListItem alignItems="flex-start">
          <ListItemText
            key={cindex++}
            primary={item.original}
            secondary={item.processed} />
          <Badge id="NumberBadge" key={cindex++} badgeContent={item.length} color="primary"/>
        </ListItem>
        <Divider key={cindex++} component="li" />
      </div>
    ));

    return (
      <div>
        <NavBar />
        <Card className="PanelCard">
          <CardContent>
            <Typography gutterBottom variant="h5" component="h2">
              String processing
            </Typography>
            <form className="form" onSubmit={this.handleSubmit}>
              <TextField id="PhraseTextField" label="enter string to process" value={this.state.phrase} onChange={this.handleChange} />
            </form>
          </CardContent>
          <CardActions>
            <Button id="submit" type="submit" color="primary" onClick={this.handleSubmit}>Submit</Button>
          </CardActions>
        </Card>
        <Card className="PanelCard">
          <CardContent>
            <Typography gutterBottom variant="h5" component="h2">
              Job history
            </Typography>
            <List>
              {listItems}
            </List>
          </CardContent>
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
    getStringHistory: () => dispatch(getStringHistory()),
    submitString: (string) => dispatch(submitString(string))
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(App);

