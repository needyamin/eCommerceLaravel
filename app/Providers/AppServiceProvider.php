<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;
use App\Support\CurrencyManager;
use App\Models\Currency;
use App\Models\EmailSetting;
use App\Models\SiteSetting;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFive();

        // Currency formatter directive
        Blade::directive('currency', function ($expression) {
            return "<?php echo \\App\\Support\\CurrencyManager::format($expression); ?>";
        });

        // Share currencies and current currency with all views
        view()->composer('*', function ($view) {
            $view->with('currentCurrency', CurrencyManager::current());
            $view->with('activeCurrencies', Currency::where('is_active', true)->get());
            try {
                $view->with('siteSettings', SiteSetting::get());
            } catch (\Throwable $e) {
                // ignored before migrations
            }
        });

        // Dynamic mail configuration from DB settings (if available)
        // This ensures SMTP settings from admin panel are applied globally
        try {
            $smtpEnabled = EmailSetting::get('smtp_enabled', '0') === '1';
            
            if ($smtpEnabled) {
                // Use SMTP settings from database
                config(['mail.default' => 'smtp']);
                
                $host = EmailSetting::get('smtp_host');
                $port = EmailSetting::get('smtp_port');
                $username = EmailSetting::get('smtp_username');
                $password = EmailSetting::get('smtp_password');
                $encryption = EmailSetting::get('smtp_encryption', 'tls');
                $fromAddress = EmailSetting::get('smtp_from_address') ?: EmailSetting::get('smtp_username');
                $fromName = EmailSetting::get('smtp_from_name') ?: EmailSetting::get('from_name', 'eCommerce Store');

                if ($host) {
                    config(['mail.mailers.smtp.host' => $host]);
                }
                if ($port) {
                    config(['mail.mailers.smtp.port' => (int) $port]);
                }
                if ($username) {
                    config(['mail.mailers.smtp.username' => $username]);
                }
                if ($password) {
                    config(['mail.mailers.smtp.password' => $password]);
                }
                if ($encryption) {
                    config(['mail.mailers.smtp.encryption' => $encryption]);
                }
                if ($fromAddress) {
                    config(['mail.from.address' => $fromAddress]);
                }
                if ($fromName) {
                    config(['mail.from.name' => $fromName]);
                }
            } else {
                // Fallback to old mail_ prefixed settings for backward compatibility
                $mailer = EmailSetting::get('mail_mailer');
                if ($mailer) {
                    config(['mail.default' => $mailer]);
                }
                $host = EmailSetting::get('mail_host');
                $port = EmailSetting::get('mail_port');
                $username = EmailSetting::get('mail_username');
                $password = EmailSetting::get('mail_password');
                $encryption = EmailSetting::get('mail_encryption');
                $fromAddress = EmailSetting::get('mail_from_address') ?: EmailSetting::get('from_email');
                $fromName = EmailSetting::get('mail_from_name') ?: EmailSetting::get('from_name', 'eCommerce Store');

                if ($host) config(['mail.mailers.smtp.host' => $host]);
                if ($port) config(['mail.mailers.smtp.port' => (int) $port]);
                if ($username) config(['mail.mailers.smtp.username' => $username]);
                if ($password) config(['mail.mailers.smtp.password' => $password]);
                if ($encryption) config(['mail.mailers.smtp.encryption' => $encryption]);
                if ($fromAddress) config(['mail.from.address' => $fromAddress]);
                if ($fromName) config(['mail.from.name' => $fromName]);
            }
        } catch (\Throwable $e) {
            // ignore if table not migrated yet
        }
    }
}
