(cd /home/jb/workspace/tinlab/teams/machine-learning-torcs; docker buildx build --load --build-arg PLATFORM=x86_64 -f torcs-agent/Dockerfile -t ghcr.io/alxcnl/torcs-agent:latest .)
(cd /home/jb/workspace/tinlab/teams/TINLML02; docker buildx build --load --build-arg PLATFORM=x86_64 -f torcs-agent/Dockerfile -t ghcr.io/alxcnl/torcs-agent:latest .)
