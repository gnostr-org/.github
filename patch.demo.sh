gnostr-git apply \
    --ignore-whitespace \
    --ignore-space-change \
    --allow-overlap -NRv \
    --cached \
    --exclude README.md \
    --exclude .gnostr/config.json \
    <(cat .gnostr/patches/* | jq -rM .content)
