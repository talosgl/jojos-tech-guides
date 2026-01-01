# Manage private and public GitHub repos from a single local git repository
### Overview
When I set up Jojo's Tech Wiki, I wanted to be able to have a separate GitHub repo for my private drafts versus articles that were public and published. I wanted to be able to use a single folder/directory on my computer for the work, but only push to the public GitHub repository when I was ready to publish. I achieve this by using a single local folder as a git repository, and connecting it to two separate GitHub remote repositories, one for private drafts, the other for published public content. 

In this guide I'll walk through how to get set up with this workflow. As a preview, essentially our strategy is to connect a single local git folder/repository to two remotes. I will go into depth below.

### Prerequisites
- Basic familiarity with Git, local git repositories, and git branches
- Familiarity with terminal and using Git terminal commands
- Familiarity GitHub, including an existing account
- Your GitHub account is already set up on your computer with proper authentication, or you know how to deal with this while working with it on the terminal. NOTE: for the purposes of this guide, we're going to assume HTTPS authentication. If have a preference for SSH or other routes, I'm going to assume you can figure out how get the right GitHub URL for the GitHub repositories.

You don't really need to understand git remotes in depth for this guide, but it will help you out as you use this workflow long-term. So don't worry about reading it right now, but bookmark this page for reference, for later: [Git Basics - Working with Remotes](https://git-scm.com/book/ms/v2/Git-Basics-Working-with-Remotes).

### Step 1: Set up your two GitHub remote repositories, public & private
I'm going to make no assumptions about your current project set up and assume you have nothing. First off, create two GitHub repositories, one public, and one private. [Here's a guide from GitHub on how to create repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository).

![Create a Remote Github Repo with private visibility](imgs/github-repo-creation-vis.png)

If you already have one GitHub repository and you're wanting to set up this private/public system, you'll just need to create the other repo, with the opposite visibility setting.

In either case, once these are both created, gather the GitHub URLs for these repos. If you don't know how to do that, check out "Copy the URL for the repository" on the [Cloning a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository) page. 

### Step 2: Clone ONE GitHub remote repository (Recommended: private)
You may start by cloning clone either of your two GitHub repositories, but I choose to clone the private one myself, because that will set it as the "default" origin. However, you can swap it around if you do it in a different order. For the purposes of the guide we'll assume we're starting with the private repo and I'll cover how to swap it later.

You'll need to set this up any time you are using a new computer. On a new machine, navigate to the folder where you want the repo to live (e.g., `~/Users/Jojo/dev/...`). Open Git Bash or the terminal you normally use git terminal commands into that folder. 

Example:
```bash
# Navigate to the parent folder in which you want your local git repo to live/get cloned into
cd c:\Users\Jojo\dev # Windows
cd ~/Users/Jojo/dev # Mac/Linux

```

By default, git remotes from GitHub clones will use the **shortname** "origin." Modify the following command to clone your GitHub remote repository with a **custom shortname,**  "private", and your own GitHub remote repository URL:
```bash
# git clone <shortname> <url>
git clone -o private https://github.com/yourUserAccount/your-repo-name-private.git
```

Example:
```bash
# Clone private repo first
# The `-o` flag (or `--origin`) lets you set the remote name during the clone operation.
git clone -o private https://github.com/talosgl/jojos-tech-guides-private.git
```

You'll see some output as it clones...
```bash
Cloning into 'jojos-tech-guides-private'...
remote: Enumerating objects: 284, done.
remote: Counting objects: 100% (284/284), done.
remote: Compressing objects: 100% (150/150), done.
remote: Total 284 (delta 119), reused 281 (delta 116), pack-reused 0 (from 0)
Receiving objects: 100% (284/284), 4.64 MiB | 54.58 MiB/s, done.
Resolving deltas: 100% (119/119), done.
```

Nice. Onto Step 3.
### Step 3: Add second GitHub repository as a second remote for the local folder/local git repo
Now change directory into the folder that just got created during the clone.
```bash
# Again, this is just an example, use your real folder's name
cd jojos-tech-guides-private
```

Like when we cloned, we're going to add a second remote here with a **custom shortname**.
```bash
# Add the public repo as a second remote
# git remote add <shortname> <url>
git remote add public https://github.com/yourUserAccount/your-public-repo-name.git
```

Example:
```bash
# Add the public repo as a second remote
git remote add public https://github.com/talosgl/jojos-tech-guides.git

# Verify your remotes
git remote -v
# Desired output
# private https://github.com/talosgl/jojos-tech-guides-private (fetch)
# private https://github.com/talosgl/jojos-tech-guides-private (push)
# public  https://github.com/talosgl/jojos-tech-guides.git (fetch)
# public  https://github.com/talosgl/jojos-tech-guides.git (push)
```

### If needed: Rename remote shortname
If you accidentally cloned with the default "origin" shortname or otherwise want to rename one of the remotes, you can do it like this:

```bash
# git remote rename <original_name> <new_name>
git remote rename origin private
```

### Step 4: Set/Ensure default `git fetch` remote to be private
In my case, I want all fetch/pull/push to default to the private GitHub remote repository. If you want that set up, keep following along.

First, check who's your default fetch. If you cloned from the private repo, that should be the default. If it's already matching what you want, you can leave it. If you need to change it, use the command:
```bash
# git branch --set-upstream-to=<shortname>/<remotebranchname> <localbranchname>
git branch --set-upstream-to=private/main main
```

Full Example:
```bash
#
git branch -vv

# BAD                       vvvvvv 
# * main           1acdf91 [public/main] Typo fix

# GOOD            vvvvvvv
# * main 1acdf91 [private/main] Typo fix

# Set local main to track private/main instead 
git branch --set-upstream-to=private/main main
```

Output showing that my default fetch for main is private:

<img src="imgs/private-upstream.png" width="400" alt="Output showing that my default fetch for main is private">

### Step 5: Set default `git push` to be private to protect against accidentally publishing draft content publicly 
For Jojo's Tech Wiki, I also want to make sure:
- I never publish to my public remote by accident/I only ever publish to my public remote intentionally
- non-main branches always get pushed to the private remote repo

To do this, we eliminate the "real" URL for pushing to the public remote, like so:
```bash
# Remove the push URL for public remote
# git remote set-url --push <shortname> <fake_URL>
git remote set-url --push public no_push

# Now you can only pull from public, not push to it
# Any push attempt will fail with an error
```
 
### Step++: Using the workflow day-to-day

#### Work on drafts in private, push to private (branch main -> main)
```bash
git add .
git commit -m "Draft: Guide for one local git repo connected to two GitHub remote repos"
git push private main
```

#### Publish to public when you're ready
```bash
# When it's time to push, and you're sure, use the full remote URL to push to public main:
# git push <public_url> <public_repo_branch_name>
git push -u https://github.com/yourUserAccount/your-public-repo-name.git main
```

#### Intentionally fetch or pull from public during your workflow:
If you make hotfixes directly on GitHub's web interface in your public repo, or if someone contributed via a pull request to your public repo, you can pull those changes back into your local repository and then push them to private to keep everything in sync.
```bash
# Fetch updates from the public repo
git fetch public

# If you want to see what's different between your local main and public main
git log main..public/main

# To merge public changes into your local main
git merge public/main

# Or to pull (fetch + merge) in one command
git pull public main
```

#### Create a non-main feature branch in private and make sure it pushes to private remote:
```bash
# We assume you already did all this locally:
# git checkout -b my_new_branch
# git add <..>
# git commit "First commit in new branch"
# ... and now you want to push to GH

# Tell an existing (local) branch to use the private remote when you push it to GH for the first time
# git push -u <shortname> <feature_branch_name>
git push -u private my_branch

# After that first `git push -u`, subsequent pushes can just be `git push`.
```

#### Ensure a non-main branch you fetched from GitHub will fetch from private remote
E.g., this feature branch was already published to GH (maybe you created it on a different computer), and you want to make sure it is using the right upstream on this computer:
```bash
git fetch private
git branch --set-upstream-to=private/my_branch my_branch_that_was_already_on_GH
```


#### Push a local private feature branch to public main branch
```bash
# Option 1: Merge to private main first, then push to public
# (Recommended - gives you a chance to review in private main)
git checkout main
git merge my_feature_branch
git push private main  # Update private main
# When ready to publish:
git push https://github.com/yourUserAccount/your-public-repo-name.git main

# Option 2: Push feature branch directly to public main
# (Use with caution - skips the private main review step)
git push https://github.com/yourUserAccount/your-public-repo-name.git my_feature_branch:main
# This pushes your local "my_feature_branch" to the remote "main" branch
```

#### Check which remote each local branch will push or fetch to/from
```bash
git branch -vv
```
