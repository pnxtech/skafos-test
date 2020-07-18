import { combineReducers } from 'redux';
import StringListReducer from './StringList';

const rootReducer = combineReducers({
  stringList: StringListReducer
});

export default rootReducer;
