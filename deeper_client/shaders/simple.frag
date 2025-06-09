#version 110

// Fragment shader simples
// Compatível com OpenGL 2.1

varying vec2 uv;
varying vec4 vertColor;

uniform sampler2D tex;

void main() {
    gl_FragColor = texture2D(tex, uv) * vertColor;
}
