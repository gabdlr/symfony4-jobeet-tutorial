<?php
namespace App\Service;

use App\Entity\Affiliate;
use Symfony\Component\Templating\EngineInterface;
use Swift_Mailer;
use Swift_Message;

class MailerService
{
    /** @var Swift_Mailer */
    private $mailer;

    /** @var EngineInterface */
    private $templateEngine;

    /**
     * @param Swift_Mailer $mailer
     */
    public function __construct(Swift_Mailer $mailer, EngineInterface $templateEngine)
    {
        $this->mailer = $mailer;
        $this->templateEngine = $templateEngine;
    }

    /**
     * @param Affiliate $affiliate
     */
    public function sendActivationEmail(Affiliate $affiliate): void
    {
        $message = (new Swift_Message())
            ->setSubject('Account activation')
            ->setTo($affiliate->getEmail())
            ->setFrom('jobeet@example.com')
            ->setBody(
                $this->templateEngine->render(
                    'emails/affiliate_activation.html.twig',
                    [
                        'token' => $affiliate->getToken(),
                    ]
                ),
                'text/html'
            );

        $this->mailer->send($message);
    }
}