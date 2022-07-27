local present, github = pcall(require, "github-theme")

if not present then
    return
end

github.setup()
