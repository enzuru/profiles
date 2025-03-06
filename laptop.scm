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
 (host-name "carbon")
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (users (cons* (user-account
                (name "enzuru")
                (comment "")
                (group "users")
                (home-directory "/home/enzuru")
                ;;(shell (file-append fish "/bin/fish"))
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
                (service mcron-service-type))
          (modify-services %desktop-services
                           (gdm-service-type config =>
                                             (gdm-configuration
                                              (wayland? #f)
                                              (auto-suspend? #f)
                                              (debug? #f))))))

 (bootloader (bootloader-configuration
              (bootloader grub-bootloader)
              (targets (list "/dev/sda"))
              (keyboard-layout keyboard-layout)))
 (swap-devices (list (swap-space
                      (target (uuid
                               "3f290639-69a8-436b-bd85-7094c541846b")))))

 ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
 ;; by running 'blkid' in a terminal.
 (file-systems (cons* (file-system
                       (mount-point "/")
                       (device (uuid
                                "56ebb14b-de7b-4ada-891e-9191b9a0dc6e"
                                'ext4))
                       (type "ext4")) %base-file-systems)))
