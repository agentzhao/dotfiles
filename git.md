### Git

# Logs

```
git log --after="2022-1-2" --before="2022-1-1"
git log --grep="regex"
git log --author="agentzhao"
git log -- file.txt
git log branch..main # commits in main but not in branch
```

# Best practices

[How to write a git commit message](https://cbea.ms/git-commit/)

A properly formed Git commit subject line should always be able to complete the following sentence:

If applied, this commit will `your subject line here`

For example:

- Refactor subsystem X for readability
- Update getting started documentation
- Remove deprecated methods
- Release version 1.0.0
- Merge pull request #123 from user/branch
- Fix failing CompositePropertySourceTests
- Add tests for ImportSelector meta-data
- Polish mockito usage
- Rework @PropertySource early parsing logic

# Sources

- [Linux Torvalds on git](https://www.youtube.com/watch?v=4XpnKHJAok8)
- [10 Years of git Interview](https://www.linux.com/news/10-years-git-interview-git-creator-linus-torvalds/)
