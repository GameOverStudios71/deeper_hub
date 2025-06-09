#version 110

// Vertex shader simples para renderização básica
// Compatível com OpenGL 2.1

attribute vec2 position;
attribute vec2 texCoord;
attribute vec4 color;

varying vec2 uv;
varying vec4 vertColor;

uniform mat4 worldMatrix;

void main() {
    gl_Position = worldMatrix * vec4(position, 0.0, 1.0);
    uv = texCoord;
    vertColor = color;
}
