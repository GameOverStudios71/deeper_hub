#version 110

// Fragment shader para Gaussian Blur
// Compatível com OpenGL 2.1

varying vec2 uv;
uniform sampler2D tex;
uniform vec2 screenSize;

// Configurações do blur
const int samples = 9;

void main(void) {
    // Array de pesos para distribuição gaussiana
    float weight[9];
    float mean = float(samples) / 2.0;
    float standardDeviation = float(samples) / 4.0;
    float sdsqrd = standardDeviation * standardDeviation * 2.0;
    
    // Calcula os pesos gaussianos
    for(int x = 0; x < samples; x++) {
        float exponent = -pow(float(x) - mean, 2.0) / sdsqrd;
        weight[x] = pow(2.718, exponent) / pow(3.141 * sdsqrd, 0.5);
    }
    
    vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
    
    // Aplica o blur em uma área NxN ao redor do pixel atual
    for(int i = 0; i < samples; i++) {
        for(int j = 0; j < samples; j++) {
            vec2 offset = vec2(float(i) / screenSize.x, float(j) / screenSize.y);
            color += texture2D(tex, uv + offset) * weight[i] * weight[j];
        }
    }
    
    gl_FragColor = color;
}
