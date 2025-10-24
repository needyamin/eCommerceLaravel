<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;
use App\Support\CurrencyManager;
use App\Models\Currency;
use App\Models\EmailSetting;

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
        });

        // Dynamic mail configuration from DB settings (if available)
        try {
            $mailer = EmailSetting::get('mail_mailer', config('mail.default'));
            if ($mailer) {
                config(['mail.default' => $mailer]);
            }
            $host = EmailSetting::get('mail_host');
            $port = EmailSetting::get('mail_port');
            $username = EmailSetting::get('mail_username');
            $password = EmailSetting::get('mail_password');
            $encryption = EmailSetting::get('mail_encryption');
            $fromAddress = EmailSetting::get('mail_from_address');
            $fromName = EmailSetting::get('mail_from_name');

            if ($host) config(['mail.mailers.smtp.host' => $host]);
            if ($port) config(['mail.mailers.smtp.port' => (int) $port]);
            if ($username) config(['mail.mailers.smtp.username' => $username]);
            if ($password) config(['mail.mailers.smtp.password' => $password]);
            if ($encryption) config(['mail.mailers.smtp.encryption' => $encryption]);
            if ($fromAddress) config(['mail.from.address' => $fromAddress]);
            if ($fromName) config(['mail.from.name' => $fromName]);
        } catch (\Throwable $e) {
            // ignore if table not migrated yet
        }
    }
}
