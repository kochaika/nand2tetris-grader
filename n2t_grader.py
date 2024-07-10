import subprocess
import sys

def grade(dir_path):
    proc = subprocess.run(["nand2tetris", "grade", dir_path], check=True, capture_output=True, timeout=1000, text=True)
    failed = ("Failed" in proc.stdout or "Errored" in proc.stdout)
    output = ""
    no_tests =  "Test" not in proc.stdout
    if no_tests:
        output += "No tests have run\n\n"
        failed = True
    output += f"STDOUT:\n{proc.stdout}"
    # output += f"\nSTDERR:\n{proc.stderr}"
    return failed, output


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Please path as an argument")
    else:
        dir_path = sys.argv[1]
        failed, output = grade(dir_path)
        if failed:
            print("Some tests are Failed:\n")
            print(output)
            exit(1)
        else:
            print("All tests passed\n")
            print(output)
            exit(0)
