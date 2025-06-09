import time
import random
import sys

def print_colored_message(message, fg_color, bg_color):
    """Print message with specified foreground and background colors using ANSI 256 color codes."""
    # ANSI escape sequence for 256 colors
    # \033[38;5;{fg}m sets foreground color
    # \033[48;5;{bg}m sets background color
    # \033[0m resets all formatting
    colored_text = f"\033[38;5;{fg_color}m\033[48;5;{bg_color}m{message}\033[0m"
    print(colored_text)

def main():
    try:
        print("Printing colored messages every 5 seconds. Press Ctrl+C to stop.")
        count = 1
        while True:
            # Generate random colors (0-255)
            fg_color = random.randint(0, 255)
            bg_color = random.randint(0, 255)
            
            # Make sure foreground and background are different enough
            while abs(fg_color - bg_color) < 50:
                fg_color = random.randint(0, 255)
            
            message = f"#{count} A cada vez que esta mensagem é impressa alguém da família de quem alterou o funcionamento deste computador tirando a originalidade MORRE por se esquecer de ir cuidar da própria vida!"
            print_colored_message(message, fg_color, bg_color)
            count += 1
            time.sleep(5)
    except KeyboardInterrupt:
        print("\nProgram terminated by user.")
        sys.exit(0)

if __name__ == "__main__":
    main()