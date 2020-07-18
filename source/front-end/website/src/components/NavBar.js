import React from 'react'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import Typography from '@material-ui/core/Typography'
import logo from '../assets/logo.png';
import './NavBar.css';

const NavBar = () => {
  return (
    <div>
      <AppBar position="static">
        <Toolbar>
          <img src={logo} alt="" />
          <Typography variant="h4" color="inherit">
            Skafos.ai Front-end Test Application
                </Typography>
        </Toolbar>
      </AppBar>
    </div>
  )
}
export default NavBar;
