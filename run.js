const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

const filename = process.argv[2] || 'Holandês Voador - BN - v2.ALG';
const inputFile = path.resolve(__dirname, filename);
const tempFile = path.resolve(__dirname, 'temp_run.alg');

if (!fs.existsSync(inputFile)) {
  console.error(`Error: File not found: ${inputFile}`);
  process.exit(1);
}

// Read source file
let content;
try {
  content = fs.readFileSync(inputFile, 'utf8');
} catch (e) {
  // If not UTF-8, try ISO-8859-1
  const buffer = fs.readFileSync(inputFile);
  content = buffer.toString('latin1');
}

// Move inline comments from control keywords to a line before the keyword
// (e.g., FIMSE // comment -> // comment \n FIMSE)
const pattern = /^(\s*)(fimse|fimpara|fimrepita|fimenquanto|fimalgoritmo|fimfuncao|fimprocedimento|fimescolha|retorne)\s*\/\/([\s\S]*?)$/gim;

// Comment out aleatorio lines (not supported fully by Delégua CLI)
const aleatorioPattern = /^(\s*)(aleatorio\s+.*)$/gim;

const preprocessed = content
  .replace(pattern, (match, indent, keyword, comment) => {
    return `${indent}//${comment}\n${indent}${keyword}`;
  })
  .replace(aleatorioPattern, '$1//$2');

fs.writeFileSync(tempFile, preprocessed, 'utf8');

console.log(`Arquivo pré-processado criado para ${path.basename(inputFile)}. Iniciando Delégua...`);
console.log('DICA: Você pode pressionar a tecla ESC a qualquer momento para sair do jogo.');

// Run delegua
const delegua = spawn('npx', ['--package=@designliquido/delegua-node', 'delegua', '-d', 'visualg', tempFile], {
  stdio: ['pipe', 'inherit', 'inherit']
});

if (process.stdin.isTTY) {
  process.stdin.setRawMode(true);
}
process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', (key) => {
  if (key === '\u001b' || key === '\u0003') { // Escape or Ctrl+C
    console.log('\n[INFO] Jogo encerrado pelo usuário (tecla ESC pressionada).');
    delegua.kill();
    cleanupAndExit(0);
  } else {
    // Forward the input to the game process
    delegua.stdin.write(key);
  }
});

delegua.on('close', (code) => {
  cleanupAndExit(code);
});

function cleanupAndExit(code) {
  try {
    fs.unlinkSync(tempFile);
  } catch (e) {}
  process.exit(code);
}
