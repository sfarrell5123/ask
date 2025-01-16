Below is an example of how you might update your **README.md** to reflect:

1. That it was originally created by an AI coding agent.  
2. Your desire to be acknowledged as the source.  
3. References (and some content) from your LinkedIn post and article.  
4. Confirmation that the MIT License is suitable for open-sourcing while retaining credit for the work.

Feel free to adjust or refine the wording as you see fit!

---

# ask - Command-Line Assistant

**ask** is a powerful command-line assistant that was originally created by an **AI coding agent**, demonstrating agentic capabilities—planning, writing code, testing, and debugging autonomously. It’s designed to streamline terminal operations using Large Language Models (LLMs) and can even write and execute scripts on your behalf.

> **Read more about the AI origins and screenshots in my LinkedIn post:**  
> [This is my AI software agent, that makes software!](https://www.linkedin.com/feed/update/urn:li:activity:7284242742518394880)  
> or check out the full article:  
> [AI: Making My ‘ask’ Command Line Helper Dude](https://www.linkedin.com/pulse/ai-making-my-ask-command-line-helper-dude-scott-farrell-e4hoc/)

---

## Features

- **AI-Created & Agentic**: Originally generated by a coding agent that autonomously plans, writes code, tests, and debugs.  
- **File Operations**: Easily write, replace, or insert content in files with intelligent assistance.  
- **Command Execution**: Execute shell commands with context-aware support and automatic validation.  
- **Task Management**: Create and execute step-by-step plans for complex tasks, ensuring accuracy and efficiency.  
- **LLM Integration**: Leverage advanced LLMs like Groq and Deepseek for intelligent decision-making and assistance.  
- **Self-Testing & Correction**: Automatically checks its own work and corrects mistakes.  
- **Data Access**: Pipe data in, provide a file reference, or just talk about a file—it will read and interpret it.  

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/sfarrell5123/ask.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd ask
   ```
3. **Install required dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
4. **Set up environment variables** by creating a `~/.env` file in your home directory with the following content:
   ```bash
   GROQ_API_KEY=your_groq_api_key
   DEEPSEEK_API_KEY=your_deepseek_api_key
   ```
5. **Make the script executable**:
   ```bash
   chmod +x ask.py
   cp ask.py /usr/local/bin/ask
   ```

## Usage

Simply type your question or command, and **ask** will handle the rest:

```bash
ask "how to list and test the contents of a tar file ?"
```

### Examples

- **File Operations**:
  ```bash
  ask "Write 'Hello, World!' to hello.py"
  ```
- **Command Execution**:
  ```bash
  ask "List all files in the current directory, tell me which is the biggest"
  ```
- **Task Management**:
  ```bash
  ask "Here is my plan (prd.txt). Read it, create the code, then test it."
  ```

---

## Detailed Examples

### File Operations

- **Append to a File**:  
  ```bash
  ask "explain this file" doSomething.py
  ```

- **Read a Specific Line from a File**:  
  ```bash
  ask "does this file discuss economics?" countries.txt
  ```

- **Delete a Line from a File**:  
  ```bash
  ls -lh | ask "which is the most recent py files that I've been working on?"
  ```

### Command Execution

- **Execute a Command with Output Redirection**:  
  ```bash
  ask "list all snapper config, and check the latest backups for each, write me a cron task for it daily"
  ```

- **Execute a Command with Piping**:  
  ```bash
  ask "update dostuff.py - it's not working "
  ```

### Task Management

- **Create a Plan with Conditional Steps**:  
  ```bash
  ask "Create a plan to deploy the application: 1. Check if the environment is set up, 2. If yes, deploy the application, 3. If no, set up the environment first"
  ```

- **Execute a Plan with Validation**:  
  ```bash
  ask "Execute the plan to deploy the application and validate each step"
  ```

---

## Troubleshooting

- **Common Issues**:
  - Make sure the `~/.env` file is correctly set up with the required API keys.
  - Place `ask` in a directory that’s in your PATH (e.g., `/usr/local/bin`).
  - Ensure the script has executable permissions.
  - Check the terminal output for any error messages and follow suggested fixes.

- **Debugging**:
  - Use the `--debug` flag to enable detailed logging:  
    ```bash
    ask --debug "Your command here"
    ```
Here’s a section you can add to your README to encourage users to share their experiences, inputs, outputs, and suggestions for improving **ask**:

---

## Community Contributions: Share Your Uses and Ideas 💡

We’re building **ask** together, and I’d love to see the creative ways you’re using it! If you’ve found an interesting use case or have ideas to make **ask** even better, here’s how you can contribute:

### Share Your Use Cases

Have you done something cool with **ask**?  
Whether it's a unique input/output combo or an unexpected automation win, I want to hear about it! Please share:

1. **Your Input**: What did you ask **ask** to do?  
   Example:  
   ```bash
   ask "can you create a bash script to monitor disk usage and send an alert if it exceeds 80%?"
   ```

2. **The Output**: How did **ask** respond?  
   Example: A generated bash script or the outcome of a complex command.

3. **Your Feedback**: How did it work? Was the result what you expected? Any tweaks or improvements you made?

Submit your examples by opening an issue in the repository .

### Suggest Ideas for Improvement

Have ideas to make **ask** even better? Here are some suggestions to spark your creativity:

- **New Features**: What’s missing that would make **ask** more useful to you?  
  Example: “Add support for Docker commands” or “Integrate with Kubernetes.”  

- **Enhancements**: Found a limitation or something that could be smarter?  
  Example: “Improve file size handling when passing large files for LLM processing.”

- **Edge Cases**: Have you found a scenario where **ask** struggled or failed?  
  Example: “ask didn’t correctly identify my Python script’s error when running a large loop.”

Submit your ideas via [GitHub Issues](https://github.com/sfarrell5123/ask/issues), or start a discussion in the repository.

---

### Why Contribute?

- **Shape the Future**: Your input directly influences **ask**’s growth and capabilities.  
- **Learn & Share**: Collaborate with others in the community to explore new use cases and ideas.  
- **Get Acknowledged**: Exceptional contributions will be highlighted in future updates!

---

I’m excited to see what you create and how we can make **ask** even better together. Let’s keep pushing the boundaries of what an AI-powered command-line assistant can do!
---

## Frequently Asked Questions (FAQ)

1. **What LLMs are supported?**  
   **ask** supports Groq and Deepseek LLMs. You can configure which model to use in the `.env` file.

2. **Can I use **ask** for scripting?**  
   Yes, **ask** can be integrated into shell scripts to automate complex tasks. It can create new files/scripts in bash or Python, then execute them—or perform a series of commands.

3. **How do I update **ask**?**  
   Pull the latest changes from the repository and reinstall the dependencies:
   ```bash
   git pull origin main
   pip install -r requirements.txt
   ```

---

## Advanced Usage

Below are some real-world terminal scenarios.

- **Linux ZFS Example**:
  ```bash
  zpool import | ask "I don't want the data pool to import automatically, but when I do, I want it to import with a root of /mnt/data. Show me how."
  ```

- **Install Linux Software**:
  ```bash
  ask "Recommend a good, easy-to-manage FTP server for my local network"
  ask "That sounds good. Make it so number 1, engage."
  ```

- **Coding**:
  ```bash
  ask "Take a look at this code and extract all YouTube video URLs from the playlist" ./bulk_transcribe_youtube_videos_from_playlist3.py
  ```

- **Image Operations**:
  ```bash
  ask "create a 1400x1400 version of maxine.png called maxine_square.png, use your tools"
  ```

---

## Contributing

Contributions are welcome! Follow these steps to get involved:

1. Fork the repository.  
2. Create a new branch for your feature or bugfix.  
3. Commit your changes.  
4. Push your branch and submit a pull request.  
5. I’m keen for collaborators—feel free to help maintain the project!

---

## License

This project is licensed under the [MIT License](LICENSE).  

> **Is the MIT License correct for reflecting you as the source?**  
> Yes! The MIT License is a popular, permissive open-source license. It requires anyone redistributing your code to include the original license and copyright notice, which ensures you are credited as the original author.

---

## Open Source Contribution Guidelines

We kindly ask that if you fork or use this code, you **acknowledge the original creator** and the AI origins of this tool. You can do so by including a simple note in your documentation or README:

```
This project is based on the original work by Scott Farrell, which was created by an AI coding agent. 
You can find the original repository at https://github.com/sfarrell5123/ask.
```

By contributing to this project, you agree to abide by these guidelines and ensure that the original author is properly credited.

---

## Contact

- **Author**: Scott Farrell  
- **Email**: sfarrell5123@gmail.com  
- **Website**: [https://leverageai.com.au](https://leverageai.com.au)
- **Maxine Headless** : https://www.youtube.com/channel/UCQuv5zq_6MkDmNRUJ2AaCjQ

> This entire project, known as **ask**, is a testament to what AI software agents can build—from the first line of code to fully autonomous planning, coding, testing, and debugging. Check out the LinkedIn references above to learn more about its creation journey!

---

*Happy coding with your new AI-powered CLI companion!*
