#version 110

// Vertex shader para renderização fullscreen
// Compatível com OpenGL 2.1

varying vec2 uv;

void main(void) {
    // Cria um triângulo que cobre toda a tela
    // Usando gl_VertexID para gerar coordenadas
    int vertexID = int(gl_Vertex.x); // Hack para simular gl_VertexID no OpenGL 2.1
    
    // Gera coordenadas UV baseadas no índice do vértice
    uv.x = mod(float(vertexID), 2.0) * 2.0;
    uv.y = floor(float(vertexID) / 2.0) * 2.0;
    
    // Converte para coordenadas de tela [-1, 1]
    gl_Position = vec4(uv * 2.0 - 1.0, 0.0, 1.0);
}
