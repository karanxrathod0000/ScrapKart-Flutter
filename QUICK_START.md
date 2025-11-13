# Quick Start Guide - Complete Setup & Deploy

## 🚀 Fast Track to Deployment

### Step 1: Download All Files from Rocket.new (⏱️ 2 mins)

1. Go to Rocket.new: https://www.rocket.new/6915ccb946629d0014fc738e
2. Click the **"Download Code"** button (top right)
3. Extract the ZIP file

### Step 2: Copy to GitHub Repository (⏱️ 3 mins)

```bash
# Clone this repo
git clone https://github.com/karanxrathod0000/ScrapKart-Flutter.git
cd ScrapKart-Flutter

# Copy all files from Rocket.new download to this folder
# Specifically copy:
# - lib/presentation/home_dashboard/widgets/ (all widget files)
# - web/ folder
# - assets/ folder (if any)
# - env.json

# Commit changes
git add .
git commit -m "Add remaining files from Rocket.new"
git push
```

### Step 3: Install Flutter & Build (⏱️ 10 mins)

```bash
# If Flutter not installed:
# Windows: Download from https://flutter.dev/docs/get-started/install/windows
# Mac: brew install flutter
# Linux: snap install flutter --classic

# Verify Flutter
flutter doctor

# Get dependencies
flutter pub get

# Build for web
flutter build web --release
```

### Step 4: Deploy to Vercel (⏱️ 3 mins)

#### Option A: Vercel CLI (Fastest)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy the build folder
cd build/web
vercel --prod

# Follow prompts:
# - Link to existing project? No
# - Project name: scrapkart-flutter
# - Deploy? Yes
```

####  Option B: Vercel Dashboard

1. Go to [vercel.com/new](https://vercel.com/new)
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. Configure:
   - **Framework Preset**: Other
   - **Build Command**: `flutter build web --release`
   - **Output Directory**: `build/web`
   - **Install Command**: Leave empty (or `flutter pub get`)
5. Click **"Deploy"**

**Note**: Vercel needs Flutter installed. If build fails:
- Build locally: `flutter build web`
- Deploy only the `build/web` folder
- Or use Firebase Hosting (see below)

### Alternative: Firebase Hosting (Recommended)

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize
firebase init hosting
# Public directory: build/web
# Single-page app: Yes

# Build & Deploy
flutter build web --release
firebase deploy

# Your app will be live at: yourproject.web.app
```

## ⚡ Fastest Method (If Flutter Not Installed)

Since building Flutter requires Flutter SDK:

1. **Download from Rocket.new** (it may include web build)
2. **Check if** `build/web` **folder exists** in download
3. **If yes**: Deploy that folder directly to Vercel
   ```bash
   cd rocket-download/build/web
   vercel --prod
   ```

## 📝 What's Already Done

✅ GitHub repository created
✅ 14 core files copied
✅ All major screens implemented
✅ Complete documentation added

## 📋 What's Remaining

- [ ] Copy 5 dashboard widget files
- [ ] Copy web/ folder
- [ ] Copy env.json
- [ ] Run `flutter build web`
- [ ] Deploy to Vercel/Firebase

## 🐛 Troubleshooting

### "Flutter command not found"
**Solution**: Install Flutter SDK from https://flutter.dev

### "Vercel build fails"
**Solution**: 
1. Build locally: `flutter build web --release`
2. Deploy the `build/web` folder directly
3. Or use Firebase Hosting

### "Missing files/widgets"
**Solution**: Download complete code from Rocket.new using "Download Code" button

## 🎯 Success Checklist

- [ ] Downloaded all files from Rocket.new
- [ ] Copied to GitHub repository
- [ ] Ran `flutter pub get`
- [ ] Built for web: `flutter build web`
- [ ] Deployed to Vercel or Firebase
- [ ] Tested the live URL

## 🔗 Useful Links

- **This Repository**: https://github.com/karanxrathod0000/ScrapKart-Flutter
- **Rocket.new Project**: https://www.rocket.new/6915ccb946629d0014fc738e
- **Flutter Docs**: https://flutter.dev/docs
- **Vercel Docs**: https://vercel.com/docs
- **Firebase Hosting**: https://firebase.google.com/docs/hosting

## 📞 Need Help?

1. Check DEPLOYMENT.md for detailed instructions
2. Check README.md for project overview
3. Review Flutter web documentation
4. Test locally first: `flutter run -d chrome`

---
**Estimated Total Time**: 15-20 minutes
**Difficulty**: Intermediate (requires Flutter SDK installation)
