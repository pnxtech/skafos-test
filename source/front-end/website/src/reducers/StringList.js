const initialState = {
  history: []
};

export default function stringListReducer(state = initialState, action) {
  let newState;
  switch (action.type) {
    case 'SL_REQUEST':
      return Object.assign({}, state, initialState);
    case 'SL_SUCCESS':
      newState = Object.assign({}, state);
      newState.history = action.payload.history.map((x) => x);
      return newState;
    case 'SL_FAILURE':
      return {...state, ...action};
    case 'SL_ADD': {
      newState = Object.assign({}, state);
      newState.history = state.history.map((x) => x);
      newState.history.push(action.payload);
      return newState;
    }
    default:
      return state;
  }
}

