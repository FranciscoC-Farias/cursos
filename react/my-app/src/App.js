import logo from './logo.svg';
import './App.css';

function App() {
  const name = "Francisco";

  function sum(a,b){
    return a + b;
  }

  return (

    <div className="App">
      <h2>Alterando o JSX</h2>
      <p>Olá, {name}</p>
      <p>Soma: {sum(2+2)}</p>
    </div>
      
  );
}

export default App;
