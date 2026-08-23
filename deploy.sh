#!/bin/bash

# CFO Unfiltered Homepage Redesign - Deployment Script
# This script helps deploy the updated homepage to production

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "CFO Unfiltered Homepage - Deployment Tool"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Step 1: Verify files exist
echo "STEP 1: Verifying files to deploy..."
echo ""

FILES_TO_CHECK=("index.html" "sk/index.html")
for file in "${FILES_TO_CHECK[@]}"; do
    if [ -f "$file" ]; then
        size=$(ls -lh "$file" | awk '{print $5}')
        print_status "Found: $file ($size)"
    else
        print_error "Missing: $file"
        exit 1
    fi
done
echo ""

# Step 2: Verify articles section exists in both files
echo "STEP 2: Verifying articles section..."
echo ""

for file in "${FILES_TO_CHECK[@]}"; do
    if grep -q "article-card" "$file"; then
        count=$(grep -c 'class="article-card"' "$file")
        print_status "$file - Found $count article cards"
    else
        print_error "$file - Articles section NOT found"
        exit 1
    fi
done
echo ""

# Step 3: Verify blog links
echo "STEP 3: Verifying blog post links..."
echo ""

for file in "${FILES_TO_CHECK[@]}"; do
    links=$(grep -o 'href="/blog/post-[0-9]*\.html"' "$file" | sort -u | wc -l)
    if [ "$links" -eq 4 ]; then
        print_status "$file - Found $links blog post links"
    else
        print_error "$file - Expected 4 blog links, found $links"
        exit 1
    fi
done
echo ""

# Step 4: Display deployment instructions
echo "STEP 4: Deployment Instructions"
echo ""
echo "Files ready for deployment:"
echo "  - index.html (English homepage)"
echo "  - sk/index.html (Slovak homepage)"
echo ""
echo "Choose your deployment method:"
echo ""
echo "METHOD A: Using Git (GitHub Pages / CI-CD)"
echo "  $ git push origin main"
echo ""
echo "METHOD B: Using SCP (SSH)"
echo "  $ scp index.html sk/index.html user@server:/path/to/html/"
echo ""
echo "METHOD C: Using Rsync"
echo "  $ rsync -avz index.html sk/index.html user@server:/path/to/html/"
echo ""
echo "METHOD D: Manual Upload via FTP/Control Panel"
echo "  1. Log into hosting control panel"
echo "  2. Upload index.html to root (/public_html/ or /www/)"
echo "  3. Upload sk/index.html to sk/ subdirectory"
echo ""
echo "METHOD E: Using scp with specific paths"
echo "  $ scp index.html user@borisdracka.com:/home/user/public_html/"
echo "  $ scp sk/index.html user@borisdracka.com:/home/user/public_html/sk/"
echo ""

# Step 5: Display verification instructions
echo "STEP 5: Post-Deployment Verification"
echo ""
echo "After deployment, verify on the live site:"
echo ""
echo "□ Hero section loads correctly"
echo "□ 'Latest Insights' section visible"
echo "□ All 4 article cards display"
echo "□ Article titles: 'The Alert That Was Wrong', 'The First Report...', etc."
echo "□ 'Read more →' links work (test one article link)"
echo "□ Mobile layout responsive (375px)"
echo "□ Desktop layout shows 3-column grid"
echo "□ Subscribe button opens beehiiv form"
echo "□ No console errors (F12 → Console)"
echo "□ Test Slovak version: https://borisdracka.com/sk/"
echo ""

# Step 6: Offer to verify deployment readiness
echo "STEP 6: Verification"
echo ""
read -p "Is your server/hosting provider ready? (yes/no): " ready

if [ "$ready" != "yes" ] && [ "$ready" != "y" ]; then
    echo ""
    print_warning "Deployment not executed. Files are ready when you need them."
    echo ""
    echo "Run this script again when ready to deploy:"
    echo "  $ bash deploy.sh"
    exit 0
fi

echo ""
print_status "Files verified and ready for deployment!"
echo ""
echo "Use one of the deployment methods above to push files to production."
echo ""
echo "Need help? Deployment details in: DEPLOYMENT_SUMMARY.md"
echo ""
