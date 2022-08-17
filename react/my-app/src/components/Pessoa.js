import style from './teste.module.css'

function Pessoa({nome,idade,profissao,foto}){
  return <div className={style.container}>
    <img src={foto} alt={nome}/>
    <p>Nome: {nome}</p>
    <p>Idade: {idade}</p>
    <p>Profissão: {profissao}</p>
  </div>
}
export default Pessoa