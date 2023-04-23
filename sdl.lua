local sdl = require "sdl2"

-- Inicialize a biblioteca SDL2
sdl.init(sdl.INIT_VIDEO)

-- Crie uma janela com as dimensões desejadas
local window = sdl.createWindow("Quadrado", sdl.WINDOWPOS_CENTERED, sdl.WINDOWPOS_CENTERED, 640, 480, sdl.WINDOW_SHOWN)

-- Crie um renderizador para desenhar na janela
local renderer = sdl.createRenderer(window, -1, sdl.RENDERER_ACCELERATED)

-- Limpe o renderizador com a cor branca
renderer:setDrawColor(255, 255, 255, 255)
renderer:clear()

-- Desenhe um quadrado vermelho na posição (100, 100) com largura e altura de 100 pixels
renderer:setDrawColor(255, 0, 0, 255)
local square = { x = 100, y = 100, w = 100, h = 100 }
renderer:drawRect(square)

-- Atualize a janela para exibir o quadrado
renderer:present()

-- Aguarde alguns segundos antes de fechar a janela
sdl.delay(3000)

-- Limpe a memória e encerre a biblioteca SDL2
sdl.quit()
