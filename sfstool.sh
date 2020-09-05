#!/data/data/com.termux/files/usr/bin/sh
dialog --backtitle 'SFStool' --menu 'What would you like to do?' 0 0 0 'sync_push' 'Push current state to Git' 'sync_pull' 'Pull current state from Git' 'archive_bp' 'Archive a blueprint' 'restore_bp' 'Unarchive a blueprint' 'archive_world' 'Archive a world' 'restore_world' 'Unarchive a world' 2>$PREFIX/$$a
clear
case $(cat $PREFIX/$$a) in
        'sync_push')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                rm -rf ~/.sfs/d
                mkdir ~/.sfs/d
                cp -r "$SFS/Custom Solar Systems" ~/.sfs/d/css
                cp -r "$SFS/Custom Translations" ~/.sfs/d/ct
                cp -r "$SFS/Resources" ~/.sfs/d/r
                cp -r "$SFS/Saving" ~/.sfs/d/s
                cd ~/.sfs
                git add .
                git commit -am.
                git push
                ;;
        'sync_pull')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                cd ~/.sfs
                git pull
                rm -rf "$SFS/Custom Solar Systems" "$SFS/Custom Translations" "$SFS/Resources" "$SFS/Saving"
                cd d
                cp -r css "$SFS/Custom Solar Systems"
                cp -r ct "$SFS/Custom Translations"
                cp -r r "$SFS/Resources"
                cp -r s "$SFS/Saving"
                ;;
        'archive_bp')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                cd ~/.sfs
                mkdir -p a/bp
                cd $SFS/saving/Blueprints
                bash -c "$(python3 -c 'import os;print("dialog --menu \"Please select a blueprint\" 0 0 0 " + "".join(["\"" + i + "\" \"\" " for i in os.listdir() if i != "display_order.ordr"]))')" 2>$PREFIX/$$a
                clear
                mv "$(cat $PREFIX/$$a)" ~/.sfs/a/bp
                ;;
        'restore_bp')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                cd ~/.sfs
                mkdir -p a/bp
                cd a/bp
                bash -c "$(python3 -c 'import os;print("dialog --menu \"Please select a blueprint\" 0 0 0 " + "".join(["\"" + i + "\" \"\" " for i in os.listdir()]))')" 2>$PREFIX/$$a
                clear
                mv "$(cat $PREFIX/$$a)" $SFS/saving/Blueprints
                ;;
        'archive_world')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                cd ~/.sfs
                mkdir -p a/w
                cd $SFS/saving/Worlds
                bash -c "$(python3 -c 'import os;print("dialog --menu \"Please select a world\" 0 0 0 " + "".join(["\"" + i + "\" \"\" " for i in os.listdir()]))')" 2>$PREFIX/$$a
                clear
                mv "$(cat $PREFIX/$$a)" ~/.sfs/a/w
                ;;
        'restore_world')
                SFS=~/storage/shared/Android/data/com.StefMorojna.SpaceflightSimulator/files
                cd ~/.sfs
                mkdir -p a/w
                cd a/w
                bash -c "$(python3 -c 'import os;print("dialog --menu \"Please select a world\" 0 0 0 " + "".join(["\"" + i + "\" \"\" " for i in os.listdir()]))')" 2>$PREFIX/$$a
                clear
                mv "$(cat $PREFIX/$$a)" $SFS/saving/Worlds
                ;;
esac
