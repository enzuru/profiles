;; Apply using: guix system reconfigure configuration.scm

(use-modules (gnu)
             (gnu packages shells)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop networking ssh xorg docker mcron)

(operating-system
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "guix")
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (users (cons* (user-account
                (name "enzuru")
                (comment "")
                (group "users")
                (home-directory "/home/enzuru")
                (shell (file-append fish "/bin/fish"))
                (supplementary-groups '("wheel" "netdev" "audio" "video" "docker")))
               %base-user-accounts))

 (packages
  (append (list (specification->package "openbox")
                (specification->package "fish"))
          %base-packages))

 (services
  (append (list (service openssh-service-type)
                (service tor-service-type)
                (service containerd-service-type)
                (service docker-service-type)
                (service mcron-service-type)
                ;;(service gnome-desktop-service-type)
                (set-xorg-configuration (xorg-configuration (keyboard-layout keyboard-layout)
                                                            (extra-config
                                                             '("Section \"Device\"
  Identifier \"AMD\"
  Driver \"amdgpu\"
  Option \"SWcursor\" \"on\"
EndSection")))))
          (modify-services %desktop-services
                           (gdm-service-type config =>
                                             (gdm-configuration
                                              (wayland? #f)
                                              (auto-suspend? #f)
                                              (debug? #f))))))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "6f31b427-bcef-4f07-9664-cab767fdaf6a")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "7D64-9652"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "ba1e94cd-42e0-4faa-abf9-b03d9ecb9c7a"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
